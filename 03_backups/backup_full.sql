USE master;
GO

-- Backup Completo (FULL) de la base de datos
BACKUP DATABASE TURISMOPERU_ADCR
TO DISK = 'F:\TurismoPeru_Seguridad_CastañedaRuizAngel\03_backups\TURISMOPERU_ADCR_Full.bak'
WITH FORMAT,
     MEDIANAME = 'TurismoPeru_Full_Backup',
     NAME = 'Backup Completo de TURISMOPERU_ADCR',
     COMPRESSION,
     STATS = 10;
GO