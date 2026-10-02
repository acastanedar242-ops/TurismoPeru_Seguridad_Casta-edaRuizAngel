USE TURISMOPERU_ADCR;
GO

-- Usuario Administrador
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'turismo_admin')
BEGIN
    CREATE USER turismo_admin FOR LOGIN turismo_admin;
END
GO

-- Usuario Vendedor
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'turismo_vendedor')
BEGIN
    CREATE USER turismo_vendedor FOR LOGIN turismo_vendedor;
END
GO

-- Usuario Analista
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'turismo_analista')
BEGIN
    CREATE USER turismo_analista FOR LOGIN turismo_analista;
END
GO