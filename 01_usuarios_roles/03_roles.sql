USE TURISMOPERU_ADCR;
GO

-- 1. Crear roles de base de datos
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'rol_vendedor' AND type = 'R')
BEGIN
    CREATE ROLE rol_vendedor;
END
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'rol_analista' AND type = 'R')
BEGIN
    CREATE ROLE rol_analista;
END
GO

-- 2. Asignar usuarios a sus respectivos roles
ALTER ROLE rol_vendedor ADD MEMBER turismo_vendedor;
ALTER ROLE rol_analista ADD MEMBER turismo_analista;

-- El Administrador tiene rol de propietario para gestión total y backups
ALTER ROLE db_owner ADD MEMBER turismo_admin;
GO