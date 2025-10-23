--Datos de prueba:
use DeviceService;
go

--EMPLEADOS
insert into Empleado (NomEmp, FchNacEmp, SueldoEmp, TipoEmp) values
('Ana', '1990-05-10', 18000, 'T'),
('Luis', '1985-08-20', 40000, 'T'),
('Pedro', '1992-01-25', 25000, 'T'),
('Sofia', '1991-11-11', 35000, 'T'),
('Mateo', '1988-04-05', 19000, 'T'),
('Maverick', '2005-01-26', 59000, 'T'),

('Carlos', '1980-03-15', 30000, 'C'),
('Laura', '1992-12-01', 22000, 'C'),
('Valeria', '1986-07-09', 36000, 'C'),
('Diego', '1995-09-14', 28000, 'C'),
('Jimena', '1983-02-20', 32000, 'C'),
('Lucas', '2000-12-10', 25000, 'C');
go

--PRODUCTOS
insert into Producto (DscProd, StkProd, CostoProd) values
('Laptop Gigabyte', 10, 1000),
('Impresora Edson', 15, 500),
('Tablet Samsung', 20, 300),
('Monitor Acer 24"', 8, 700),
('Router AC', 25, 200),
('Disco Kingston SSD 1TB', 30, 150),
('Teclado Mecanico Razer', 50, 120),
('Mouse Gamer Razer', 40, 80),
('Camara Web Logitech C505 HD', 18, 180),
('Proyector LED Ledstar', 5, 1100);
go

--UNIDADES
--Producto 1
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000001001', 1, '2022-01-01', '2026-01-01'),
('U000001002', 1, '2022-02-01', '2026-02-01'),
('U000001003', 1, '2022-03-01', '2026-03-01'),
('U000001004', 1, '2022-04-01', '2026-04-01');
go

--Producto 2
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000002001', 2, '2022-01-01', '2026-01-01'),
('U000002002', 2, '2022-02-01', '2026-02-01'),
('U000002003', 2, '2022-03-01', '2026-03-01'),
('U000002004', 2, '2022-04-01', '2026-04-01');
go

--Producto 3
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values 
('U000003001', 3, '2022-01-01', '2026-01-01'),
('U000003002', 3, '2022-02-01', '2026-02-01'),
('U000003003', 3, '2022-03-01', '2026-03-01'),
('U000003004', 3, '2022-04-01', '2026-04-01');
go

--Producto 4
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000004001', 4, '2022-01-01', '2026-01-01'),
('U000004002', 4, '2022-02-01', '2026-02-01'),
('U000004003', 4, '2022-03-01', '2026-03-01'),
('U000004004', 4, '2022-04-01', '2026-04-01');
go

--Producto 5
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000005001', 5, '2022-01-01', '2026-01-01'),
('U000005002', 5, '2022-02-01', '2026-02-01'),
('U000005003', 5, '2022-03-01', '2026-03-01'),
('U000005004', 5, '2022-04-01', '2026-04-01');
go

--Producto 6
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000006001', 6, '2022-01-01', '2026-01-01'),
('U000006002', 6, '2022-02-01', '2026-02-01'),
('U000006003', 6, '2022-03-01', '2026-03-01'),
('U000006004', 6, '2022-04-01', '2026-04-01');
go

--Producto 7
insert into Unidad(NumSerie, IdProd, FchFab, FchVto) values
('U000007001', 7, '2022-01-01', '2026-01-01'),
('U000007002', 7, '2022-02-01', '2026-02-01'),
('U000007003', 7, '2022-03-01', '2026-03-01'),
('U000007004', 7, '2022-04-01', '2026-04-01');
go

--Producto 8
insert into Unidad values
('U000008001', 8, '2022-01-01', '2026-01-01'),
('U000008002', 8, '2022-02-01', '2026-02-01'),
('U000008003', 8, '2022-03-01', '2026-03-01'),
('U000008004', 8, '2022-04-01', '2026-04-01');
go

--Producto 9
insert into Unidad values
('U000009001', 9, '2022-01-01', '2026-01-01'),
('U000009002', 9, '2022-02-01', '2026-02-01'),
('U000009003', 9, '2022-03-01', '2026-03-01'),
('U000009004', 9, '2022-04-01', '2026-04-01');
go

--Producto 10
insert into Unidad values
('U000010001', 10, '2022-01-01', '2026-01-01'),
('U000010002', 10, '2022-02-01', '2026-02-01'),
('U000010003', 10, '2022-03-01', '2026-03-01'),
('U000010004', 10, '2022-04-01', '2026-04-01');
go

--REPARACIONES
insert into Repara values
('U000001001', 1, 1, GETDATE(), 10, 'Iniciado', NULL),
('U000002001', 2, 1, GETDATE(), 40, 'Iniciado', NULL),
('U000003001', 3, 1, GETDATE(), 65, 'Iniciado', NULL),
('U000004001', 4, 1, GETDATE(), 120, 'Iniciado', NULL),
('U000005001', 5, 1, GETDATE(), 12, 'Iniciado', NULL),
('U000006001', 6, 1, DATEADD(DAY, -5, GETDATE()), 85, 'Iniciado', NULL),
('U000007001', 7, 1, GETDATE(), 320, 'Iniciado', NULL),
('U000008001', 8, 1, GETDATE(), 140, 'Iniciado', NULL),
('U000009001', 9, 1, GETDATE(), 55, 'Iniciado', NULL),
('U000010001', 10, 1, GETDATE(), 09, 'Iniciado', NULL),
('U000002002', 2, 2, GETDATE(), 200, 'Iniciado', NULL),
('U000003002', 3, 3, GETDATE(), 180, 'Iniciado', NULL),
('U000004002', 4, 4, GETDATE(), 220, 'Iniciado', NULL),
('U000005002', 5, 5, DATEADD(DAY, -1, GETDATE()), 250, 'Iniciado', NULL),
('U000007002', 7, 2, DATEADD(DAY, -3, GETDATE()), 50, 'Iniciado', NULL),
('U000008002', 8, 3, DATEADD(DAY, -4, GETDATE()), 90, 'Iniciado', NULL),
('U000009002', 9, 4, DATEADD(DAY, -2, GETDATE()), 170, 'Iniciado', NULL),
('U000010002', 10, 5, DATEADD(DAY, -1, GETDATE()), 120, 'Iniciado', NULL),
('U000001002', 1, 3, DATEADD(DAY, -1, GETDATE()), 130, 'Iniciado', NULL),
('U000002003', 2, 2, DATEADD(DAY, -1, GETDATE()), 90, 'Iniciado', NULL);
go