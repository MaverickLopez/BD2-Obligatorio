--CONSULTAS
use DeviceService;

--INDICES
--Para las cosas que mas se utilizan
create index ix_Repara_IdEmp on Repara(IdEmp);
create index ix_Repara_IdEmpQA on Repara(IdEmpQA);
create index ix_Repara_StsRepara on Repara(StsRepara);
create index ix_Repara_FchRepara on Repara(FchRepara);
create index ix_Repara_NumSerie_IdProd on Repara(NumSerie, IdProd);
create index ix_Unidad_IdProd on Unidad(IdProd);
create index ix_Empleado_TipoEmp on Empleado(TipoEmp);

--3)
--a)
select 
    p.IdProd as Id_del_Producto,
    p.DscProd as Producto,
    count(case when r.IdEmpQA is not null then 1 end) as Con_Control_de_Calidad,
    count(case when r.IdEmpQA is null then 1 end) as Sin_Control_de_Calidad,
    count(case when r.CostoRepara > 100 then 1 end) as Reparaciones_Mayores_a_100
from Producto p join Repara r on p.IdProd = r.IdProd
group by p.IdProd, p.DscProd
order by p.IdProd;
	
--b)
select top 1 
    e.IdEmp as Id_del_Empleado,
    e.NomEmp as Nombre_del_Empleado,
    e.TipoEmp as Tipo_del_Empleado,
    count(*) as Cantidad_de_Reparaciones
from Empleado e join Repara r on e.IdEmp = r.IdEmp
group by e.IdEmp, e.NomEmp, e.TipoEmp
order by Cantidad_de_Reparaciones desc;


--c)
select 
    p.IdProd as Id_del_Producto,
    p.DscProd as Nombre_del_Producto,
    sum(r.CostoRepara) as Costo_Total_de_las_Reparaciones
from Producto p join Repara r on p.IdProd = r.IdProd
group by p.IdProd, p.DscProd
having sum(r.CostoRepara) > 200
order by Costo_Total_de_las_Reparaciones desc;

--d)
select top 1 
    p.IdProd,
    p.DscProd,
    count(*) as CantReparaciones
from Producto p join Repara r on p.IdProd = r.IdProd
group by p.IdProd, p.DscProd
order by CantReparaciones desc;

--e)
/*Justificacion: Para la clasificacion de salarios me baso en el tipo de emplado y su sueldo,
ya que cada profesion tiene distintos sueldos.
Para la categoria del empleado me baso tambien en su salario y tipo, ya que a mas salario,
mas experiencia.*/

select e.IdEmp, e.NomEmp, e.SueldoEmp, e.TipoEmp,
    --Clasificación del salario
    case 
        when e.TipoEmp = 'T' and e.SueldoEmp <= 30000 then 'Bajo'
        when e.TipoEmp = 'T' and e.SueldoEmp BETWEEN 30001 and 45000 then 'Medio'
        when e.TipoEmp = 'T' and e.SueldoEmp > 45000 then 'Alto'

        when e.TipoEmp = 'C' and e.SueldoEmp <= 20000 then 'Bajo'
        when e.TipoEmp = 'C' and e.SueldoEmp BETWEEN 20001 and 30000 then 'Medio'
        when e.TipoEmp = 'C' and e.SueldoEmp > 30000 then 'Alto'
    end as Nivel_Salarial,
    
    --Categoría según tipo y salario (técnico o controller)
    case 
        when e.TipoEmp = 'T' and e.SueldoEmp > 45000 then 'Senior Técnico'
        when e.TipoEmp = 'T' and e.SueldoEmp BETWEEN 30001 and 45000 then 'Experimentado Técnico'
        when e.TipoEmp = 'T' and e.SueldoEmp <= 30000 then 'Junior Técnico'
        
        when e.TipoEmp = 'C' and e.SueldoEmp > 30000 then 'Senior Controller'
        when e.TipoEmp = 'C' and e.SueldoEmp BETWEEN 20001 and 30000 then 'Experimentado Controller'
        when e.TipoEmp = 'C' and e.SueldoEmp <= 20000 then 'Junior Controller'
        
    end as Categoria_del_Empleado,
    
    --Cantidad de reparaciones realizadas (solo técnicos)
    count(case when e.TipoEmp = 'T' then r.IdRepara end) as Cantidad_de_Reparaciones

from Empleado e left join Repara r on e.IdEmp = r.IdEmp
group by e.IdEmp, e.NomEmp, e.SueldoEmp, e.TipoEmp
order by e.SueldoEmp desc, Cantidad_de_Reparaciones desc;

--f)
select 
    e.IdEmp,
    e.NomEmp,
    --Si no tiene reparaciones muestra 0, en lugar de null.
    isnull(sum(r.CostoRepara), 0) as CostoTotalReparaciones
from Empleado e left join Repara r on e.IdEmp = r.IdEmp
where e.TipoEmp = 'T'
group by e.IdEmp, e.NomEmp
order by CostoTotalReparaciones desc;

--Costo total de todas las reparaciones
select sum(CostoRepara) as Costo_Total_General from Repara;

--g)
select e.IdEmp, e.NomEmp, e.TipoEmp
from Empleado e join Repara r on e.IdEmp = r.IdEmp
where e.TipoEmp = 'T'
group by e.IdEmp, e.NomEmp, e.TipoEmp
having count(distinct r.IdProd) = (select count(*) from Producto);