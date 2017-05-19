------------------------------------------------------------
-- Schema Roles
------------------------------------------------------------
SELECT '-- CREATE RO/WO ROLES FOR EACH SCHEMAS'
SELECT 'CREATE ROLE ' || schema_name || '_ro;' FROM schemata WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex');
SELECT 'CREATE ROLE ' || schema_name || '_wo;' FROM schemata WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex');
SELECT 'CREATE ROLE all_schema_readonly;'

------------------------------------------------------------
-- Grant Schema Roles
------------------------------------------------------------
SELECT '-- GRANT RO/WO SCHEMA FOR EACH ROLES'
SELECT 'GRANT SELECT, REFERENCES ON ALL TABLES IN SCHEMA ' || schema_name || ' to ' || schema_name || '_ro;' FROM schemata WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex');
SELECT 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ' || schema_name || ' to ' || schema_name || '_wo;' FROM schemata WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex');
SELECT 'GRANT ' || schema_name || '_ro TO all_schema_readonly;' FROM schemata WHERE schema_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex');
