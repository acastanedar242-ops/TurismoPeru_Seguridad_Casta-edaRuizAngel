USE master;
GO

-- 1. Login para Administrador
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'turismo_admin')
BEGIN
    CREATE LOGIN turismo_admin WITH PASSWORD = 'Admin#Turismo2026!', CHECK_POLICY = ON;
END
GO

-- 2. Login para Vendedor
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'turismo_vendedor')
BEGIN
    CREATE LOGIN turismo_vendedor WITH PASSWORD = 'Vendedor#Turismo2026!', CHECK_POLICY = ON;
END
GO

-- 3. Login para Analista
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'turismo_analista')
BEGIN
    CREATE LOGIN turismo_analista WITH PASSWORD = 'Analista#Turismo2026!', CHECK_POLICY = ON;
END
GO