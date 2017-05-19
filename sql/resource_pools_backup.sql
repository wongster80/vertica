SELECT    'CREATE RESOURCE POOL ' || name
        || CASE WHEN memorysize                IS NULL THEN ' ' ELSE ' MEMORYSIZE '                 || '''' || memorysize               || '''' END
        || CASE WHEN maxmemorysize = ''                THEN ' ' ELSE ' MAXMEMORYSIZE '              || '''' || maxmemorysize            || '''' END
        || CASE WHEN executionparallelism     = 'AUTO' THEN ' ' ELSE ' EXECUTIONPARALLELISM '       || '''' || executionparallelism     || '''' END
        || CASE WHEN NULLIFZERO(priority)      IS NULL THEN ' ' ELSE ' PRIORITY '                   || '''' || priority                 || '''' END
        || CASE WHEN runtimepriority           IS NULL THEN ' ' ELSE ' RUNTIMEPRIORITY '            ||         runtimepriority                  END
        || CASE WHEN runtimeprioritythreshold  IS NULL THEN ' ' ELSE ' RUNTIMEPRIORITYTHRESHOLD '   ||         runtimeprioritythreshold         END
        || CASE WHEN queuetimeout              IS NULL THEN ' ' ELSE ' QUEUETIMEOUT '               ||         queuetimeout                     END
        || CASE WHEN maxconcurrency            IS NULL THEN ' ' ELSE ' MAXCONCURRENCY '             ||         maxconcurrency                   END
        || CASE WHEN runtimecap                IS NULL THEN ' ' ELSE ' RUNTIMECAP '                 || '''' || runtimecap               || '''' END
        || ' ; '
FROM v_catalog.resource_pools
WHERE NOT is_internal
ORDER BY name;

