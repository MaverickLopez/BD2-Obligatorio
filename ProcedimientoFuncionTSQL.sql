--PROCEDIMIENTO Y FUNCION
use DeviceService;

--4)
--a)
create procedure sp_RegistrarReparacion
    @NumSerie char(10),
    @IdProd int,
    @IdEmp int,
    @CostoRepara money
as
begin
    set nocount on;

    --Validar que la unidad exista
    if not exists (
        select 1 from Unidad where NumSerie = @NumSerie and IdProd = @IdProd
    )
    begin
        print 'La unidad no existe.';
        return;
    end

    --Validar que el empleado exista
    if not exists (
        select 1 from Empleado where IdEmp = @IdEmp
    )
    begin
        print 'El empleado no existe.';
        return;
    end

    --Validar que el costo no sea negativo
    if @CostoRepara < 0
    begin
        print 'El costo de reparación no puede ser negativo.';
        return;
    end

    --Validar que no haya reparación repetida hoy
    if exists (
        select 1 from Repara where NumSerie = @NumSerie
          and IdProd = @IdProd and IdEmp = @IdEmp
          and convert(date, FchRepara) = convert(date, getdate())
    )
    begin
        print 'Ya existe una reparación registrada hoy para esta unidad por este empleado.';
        return;
    end

    --Insert de la reparacion
    insert into Repara(NumSerie, IdProd, IdEmp, FchRepara, CostoRepara, StsRepara) values
    (@NumSerie, @IdProd, @IdEmp, GETDATE(), @CostoRepara, 'Iniciado');

    print 'Reparación registrada con éxito.';
end

--Este no anda
exec sp_RegistrarReparacion 
    @NumSerie = 'ABC12345678',
    @IdProd = 1,
    @IdEmp = 10,
    @CostoRepara = 150.00;

--Este si anda
exec sp_RegistrarReparacion 
    @NumSerie = 'U000010001',
    @IdProd = 10,
    @IdEmp = 6,
    @CostoRepara = 200.00;

--Para probarlo
select * from Repara where IdEmp='6';



--b)
create function fn_CalcularTiempoReparacion
(
    @NumSerie char(10),
    @IdProd int
)
returns int
as
begin
    declare @DiasUnicos int;

    --Se convierte FchRepara a date para contar solo la fecha (no la hora).
    select @DiasUnicos = count(distinct convert(date, FchRepara))
    from Repara where NumSerie = @NumSerie and IdProd = @IdProd;

    if @DiasUnicos = 0
        return NULL;

    return @DiasUnicos;
end

--Para probar
select dbo.fn_CalcularTiempoReparacion('U000003002', 3) as DiasReparacion;

select dbo.fn_CalcularTiempoReparacion('U000010004', 10) as DiasReparacion;
