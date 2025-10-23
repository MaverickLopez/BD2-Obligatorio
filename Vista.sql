--Datos de prueba:
use DeviceService;

--6)
create view vw_ReparacionesActivas as
select r.IdRepara, r.NumSerie, r.IdProd,
    p.DscProd, e.NomEmp, r.FchRepara, r.StsRepara
from Repara r join Producto p on r.IdProd = p.IdProd
join Empleado e on r.IdEmp = e.IdEmp
where r.StsRepara in ('Iniciado', 'En testing');

--Para probar:
select * from vw_ReparacionesActivas;