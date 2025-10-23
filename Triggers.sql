--TRIGGERS
use DeviceService;

--5)
--a)
create trigger trg_ControlEstadoReparacion
on Repara
after update
as
begin
    set nocount on;

    insert into HistoricoReparacion (IdRepara, NumSerie, IdProd, EstadoAnterior, EstadoNuevo)
    select d.IdRepara, d.NumSerie, d.IdProd, d.StsRepara, i.StsRepara
    from inserted i inner join deleted d on i.IdRepara = d.IdRepara
    where i.StsRepara in ('Terminado', 'Cancelado')     -- nuevo estado válido
        and i.StsRepara <> d.StsRepara;               -- solo si hubo cambio real

end;

--Verifico que este iniciado
select IdRepara, NumSerie, IdProd, StsRepara from Repara where IdRepara = 1;

--Hago el cambio
update Repara set StsRepara = 'Terminado' where IdRepara = 1;

--Reviso el cambio
select * from HistoricoReparacion where IdRepara = 1;

--b)
create trigger trg_PrevenirEliminacionReparaciones
on Repara
instead of delete
as
begin
    set nocount on;

    --Verifico si hay reparaciones con un estado invalido
    if exists (select 1 from deleted where StsRepara in ('En testing', 'Terminado'))

    begin
        print 'No se permite eliminar las reparaciones que se encuentren en estado "En testing" o "Terminado".';
        return;
    end

    --Registro eliminaciones permitidas
    insert into HistoricoEliminacionReparaciones (IdRepara, NumSerie, IdProd, StsRepara)
    select IdRepara, NumSerie, IdProd, StsRepara from deleted;

    --Elimino registros permitidos
    delete from Repara where IdRepara in (select IdRepara from deleted);
end;

--Este no va a dejar, si te deja es porque no probaste el trigger anterior, por lo que no tiene el estado terminado
delete from Repara where NumSerie = 'U000001001' and IdProd = 1;

--Este si
delete from Repara where NumSerie = 'U000004002' and IdProd = 4;

select * from HistoricoEliminacionReparaciones where NumSerie = 'U000004002' and IdProd = 4;