USE TURISMOPERU_ADCR;
GO

-- =========================================================================
-- ACTIVIDAD 5: ESTRATEGIA DE IMPORTACIÓN Y STAGING
-- =========================================================================

-- 1. Crear tabla de staging (área intermedia de recepción)
IF OBJECT_ID('ADCR.cliente_importacion', 'U') IS NOT NULL
    DROP TABLE ADCR.cliente_importacion;
GO

CREATE TABLE ADCR.cliente_importacion (
    Documento VARCHAR(20),
    Nombres VARCHAR(100),
    ApellidoPaterno VARCHAR(100),
    ApellidoMaterno VARCHAR(100)
);
GO

-- 2. Cargar los datos desde el archivo clientes.csv a la tabla staging
-- Puede realizarse con bcp in o mediante BULK INSERT:
BULK INSERT ADCR.cliente_importacion
FROM 'F:\TurismoPeru_Seguridad_CastañedaRuizAngel\02_importacion_exportacion\clientes.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1,              -- Si no tiene fila de cabecera inicia en 1
    CODEPAGE = '65001',        -- Codificación UTF-8
    TABLOCK
);
GO

-- 3. Validar registros (identificar nulos o incompletos)
SELECT * 
FROM ADCR.cliente_importacion
WHERE Documento IS NULL 
   OR Nombres IS NULL 
   OR ApellidoPaterno IS NULL;
GO

-- 4. Identificar duplicados internos dentro del archivo importado
SELECT 
    Documento, 
    COUNT(*) AS Repeticiones
FROM ADCR.cliente_importacion
GROUP BY Documento
HAVING COUNT(*) > 1;
GO

-- 5. Identificar registros que ya existen previamente en la base de datos
SELECT imp.*
FROM ADCR.cliente_importacion imp
WHERE EXISTS (
    SELECT 1 
    FROM ADCR.persona p
    WHERE p.numero_documento = imp.Documento
);
GO

-- 6. Insertar únicamente registros válidos y no duplicados
-- (Ejemplo de carga a la tabla maestra asegurando integridad)
/*
INSERT INTO ADCR.persona (numero_documento, nombres, apellido_paterno, apellido_materno)
SELECT DISTINCT 
    imp.Documento, 
    imp.Nombres, 
    imp.ApellidoPaterno, 
    imp.ApellidoMaterno
FROM ADCR.cliente_importacion imp
WHERE imp.Documento IS NOT NULL
  AND NOT EXISTS (
      SELECT 1 
      FROM ADCR.persona p 
      WHERE p.numero_documento = imp.Documento
  );
*/
GO