------------------------------------------------------------
-- Create storage locations
------------------------------------------------------------
SELECT '-- Create storage locations';
SELECT 'CREATE LOCATION ' ||  '''' || location_path || '''' || ' USAGE ' || '''' || location_usage || '''' || ' ON ALL NODES;'
FROM storage_locations
WHERE location_usage IN ('USER') AND is_retired = 'f' 
ORDER BY location_path;

