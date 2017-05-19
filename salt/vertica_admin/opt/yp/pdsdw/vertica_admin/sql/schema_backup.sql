------------------------------------------------------------
-- Create schemas
------------------------------------------------------------
SELECT '-- Create schema';
SELECT 'CREATE SCHEMA ' || schema_name  ||  ';'
FROM schemata
WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex','v_txtindex') AND schema_name NOT LIKE 'v_%' AND schema_name NOT LIKE '%_scheduler'
ORDER BY schema_name;

