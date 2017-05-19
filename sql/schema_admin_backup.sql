------------------------------------------------------------
-- Schema
------------------------------------------------------------
SELECT '-- Create Schema';
SELECT 'CREATE SCHEMA ' || schema_name  ||  ';'
FROM schemata
WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex')
ORDER BY 1;
