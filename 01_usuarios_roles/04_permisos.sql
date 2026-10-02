USE TURISMOPERU_ADCR;
GO

-- =============================================
-- PERMISOS PARA: rol_vendedor
-- =============================================
-- Permisos de lectura e inserción
GRANT SELECT, INSERT ON ADCR.cliente TO rol_vendedor;
GRANT SELECT, INSERT ON ADCR.reserva TO rol_vendedor;
GRANT SELECT ON ADCR.habitacion TO rol_vendedor;
GRANT SELECT ON ADCR.paquete_hospedaje TO rol_vendedor;

-- Denegación explícita de eliminación (Principio de mínimo privilegio)
DENY DELETE ON ADCR.cliente TO rol_vendedor;
DENY DELETE ON ADCR.reserva TO rol_vendedor;

-- =============================================
-- PERMISOS PARA: rol_analista
-- Solo lectura en tablas necesarias para análisis
-- =============================================
GRANT SELECT ON ADCR.cliente TO rol_analista;
GRANT SELECT ON ADCR.reserva TO rol_analista;
GRANT SELECT ON ADCR.pago TO rol_analista;
GRANT SELECT ON ADCR.habitacion TO rol_analista;
GRANT SELECT ON ADCR.paquete TO rol_analista;
GRANT SELECT ON ADCR.lugar_turistico TO rol_analista;
GRANT SELECT ON ADCR.paquete_hospedaje TO rol_analista;
GO