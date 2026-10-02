USE TURISMOPERU_ADCR;
GO

-- =======================================================
-- PRUEBA 1: Verificar permisos del ANALISTA
-- =======================================================
EXECUTE AS USER = 'turismo_analista';
PRINT '--- Probando como turismo_analista ---';

-- A) Esta consulta DEBE funcionar (SELECT permitido):
SELECT TOP 5 * FROM ADCR.cliente;

-- B) Esta operación DEBE FALLAR con error de permisos (INSERT denegado):
INSERT INTO ADCR.pago (id_reserva, id_medio_pago, monto, fecha_pago)
VALUES (1, 1, 100.00, GETDATE());

REVERT;
GO

-- =======================================================
-- PRUEBA 2: Verificar restricciones del VENDEDOR
-- =======================================================
EXECUTE AS USER = 'turismo_vendedor';
PRINT '--- Probando como turismo_vendedor ---';

-- A) Esta consulta DEBE funcionar:
SELECT TOP 5 * FROM ADCR.cliente;

-- B) Esta operación DEBE FALLAR con error (DELETE denegado):
DELETE FROM ADCR.cliente WHERE id_cliente = 99999;

REVERT;
GO