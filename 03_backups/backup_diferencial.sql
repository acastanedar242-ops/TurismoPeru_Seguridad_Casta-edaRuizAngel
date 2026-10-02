USE master;
GO

-- Backup Diferencial (registra cambios desde el último Full)
BACKUP DATABASE TURISMOPERU_ADCR
TO DISK = 'F:\TurismoPeru_Seguridad_CastañedaRuizAngel\03_backups\TURISMOPERU_ADCR_Diff.bak'
WITH DIFFERENTIAL,
     NAME = 'Backup Diferencial de TURISMOPERU_ADCR',
     COMPRESSION,
     STATS = 10;
GO