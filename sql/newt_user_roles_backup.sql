    ?column?     
-----------------
 -- Create Roles
(1 row)

                TXT_CR                 
---------------------------------------
 CREATE ROLE SEM_ro ;
 CREATE ROLE TxtIndex_ro ;
 CREATE ROLE TxtIndex_wo ;
 CREATE ROLE WebAnalyticsDWng_Dim_ro ;
 CREATE ROLE WebAnalyticsDWng_ro ;
 CREATE ROLE WebanalyticsDW_ro ;
 CREATE ROLE WebanalyticsDW_wo ;
 CREATE ROLE WebanalyticsDWng_Dim_wo ;
 CREATE ROLE WebanalyticsDWng_wo ;
 CREATE ROLE all_schema_readonly ;
 CREATE ROLE bi_logstore_ro ;
 CREATE ROLE bi_sysinfo_ro ;
 CREATE ROLE bi_sysinfo_wo ;
 CREATE ROLE bkp_ro ;
 CREATE ROLE bkp_wo ;
 CREATE ROLE csdw_etl_ro ;
 CREATE ROLE csdw_etl_wo ;
 CREATE ROLE csdw_ro ;
 CREATE ROLE csdw_stag_ro ;
 CREATE ROLE csdw_stag_wo ;
 CREATE ROLE csdw_wo ;
 CREATE ROLE dbduser_role ;
 CREATE ROLE dev_cp_ro ;
 CREATE ROLE dev_cp_wo ;
 CREATE ROLE dev_ro ;
 CREATE ROLE dev_wo ;
 CREATE ROLE edw_ro ;
 CREATE ROLE ext_ro ;
 CREATE ROLE ext_wo ;
 CREATE ROLE gridprod_ro ;
 CREATE ROLE map_ro ;
 CREATE ROLE map_wo ;
 CREATE ROLE pdrbackup_ro ;
 CREATE ROLE pdrextracts_ro ;
 CREATE ROLE pdrextracts_wo ;
 CREATE ROLE pdrmapping_ro ;
 CREATE ROLE pdrmonitor_ro ;
 CREATE ROLE pdrstag_ro ;
 CREATE ROLE pdrstag_wo ;
 CREATE ROLE pdrtemp_ro ;
 CREATE ROLE pdrtemp_wo ;
 CREATE ROLE pdsplatform_ro ;
 CREATE ROLE pdsplatform_wo ;
 CREATE ROLE pdsqa_ro ;
 CREATE ROLE pdsqa_wo ;
 CREATE ROLE pdstest_role ;
 CREATE ROLE stg_ro ;
 CREATE ROLE stg_wo ;
 CREATE ROLE tmp_cp_ro ;
 CREATE ROLE tmp_cp_wo ;
 CREATE ROLE tmp_ro ;
 CREATE ROLE tmp_wo ;
 CREATE ROLE uat_cp_ro ;
 CREATE ROLE uat_cp_wo ;
 CREATE ROLE uat_ro ;
 CREATE ROLE uat_wo ;
 CREATE ROLE wadw_stag_ro ;
 CREATE ROLE wadw_stag_wo ;
 CREATE ROLE ypa_ro ;
 CREATE ROLE ypa_wo ;
 CREATE ROLE ypc_bi_audit_ro ;
 CREATE ROLE ypc_bi_report_ro ;
 CREATE ROLE ypc_bi_report_temp_ro ;
(63 rows)

    ?column?     
-----------------
 -- Create Users
(1 row)

                        ?column?                        
--------------------------------------------------------
 CREATE USER abalsim RESOURCE POOL adhoc_query ;
 CREATE USER ac6429 RESOURCE POOL adhoc_query ;
 CREATE USER adasoar RESOURCE POOL adhoc_query ;
 CREATE USER ah5454 RESOURCE POOL adhoc_query ;
 CREATE USER ar4448 RESOURCE POOL adhoc_query ;
 CREATE USER aw110f RESOURCE POOL adhoc_query ;
 CREATE USER bizi RESOURCE POOL batch_bizi ;
 CREATE USER bmajeska RESOURCE POOL adhoc_query ;
 CREATE USER bo RESOURCE POOL report ;
 CREATE USER clin RESOURCE POOL adhoc_query ;
 CREATE USER csdw RESOURCE POOL batch_platform ;
 CREATE USER dbd RESOURCE POOL batch_platform ;
 CREATE USER dbdb RESOURCE POOL adhoc_query ;
 CREATE USER edw RESOURCE POOL batch_platform ;
 CREATE USER estetzler RESOURCE POOL adhoc_query ;
 CREATE USER gj870q RESOURCE POOL adhoc_query ;
 CREATE USER glangewisch RESOURCE POOL adhoc_query ;
 CREATE USER gridappsro RESOURCE POOL adhoc_query ;
 CREATE USER gridprod RESOURCE POOL report ;
 CREATE USER ia1521 RESOURCE POOL adhoc_query ;
 CREATE USER ideck RESOURCE POOL adhoc_query ;
 CREATE USER ja5058 RESOURCE POOL adhoc_query ;
 CREATE USER ja9408 RESOURCE POOL adhoc_query ;
 CREATE USER jbdair RESOURCE POOL adhoc_query ;
 CREATE USER jbrinker RESOURCE POOL adhoc_query ;
 CREATE USER jbuslon RESOURCE POOL adhoc_query ;
 CREATE USER jc2746 RESOURCE POOL adhoc_query ;
 CREATE USER jd1509 RESOURCE POOL adhoc_query ;
 CREATE USER jd5409 RESOURCE POOL adhoc_query ;
 CREATE USER jl2978 RESOURCE POOL adhoc_query ;
 CREATE USER jlemen RESOURCE POOL adhoc_query ;
 CREATE USER jp0600 RESOURCE POOL adhoc_query ;
 CREATE USER js4738 RESOURCE POOL adhoc_query ;
 CREATE USER jstooksberry RESOURCE POOL adhoc_query ;
 CREATE USER kdaman RESOURCE POOL adhoc_query ;
 CREATE USER khaq RESOURCE POOL adhoc_query ;
 CREATE USER klee RESOURCE POOL adhoc_query ;
 CREATE USER klin RESOURCE POOL adhoc_query ;
 CREATE USER mm9239 RESOURCE POOL adhoc_query ;
 CREATE USER ny6877 RESOURCE POOL adhoc_query ;
 CREATE USER pds_monitoring RESOURCE POOL adhoc_query ;
 CREATE USER pdsplatform RESOURCE POOL adhoc_query ;
 CREATE USER pdsqa RESOURCE POOL adhoc_query ;
 CREATE USER pdstest RESOURCE POOL pdstest ;
 CREATE USER ps0301 RESOURCE POOL adhoc_query ;
 CREATE USER pvenkatesan RESOURCE POOL adhoc_query ;
 CREATE USER pvijayvargiya RESOURCE POOL adhoc_query ;
 CREATE USER rd0878 RESOURCE POOL adhoc_query ;
 CREATE USER rp9686 RESOURCE POOL adhoc_query ;
 CREATE USER rs7644 RESOURCE POOL adhoc_query ;
 CREATE USER schaudhuri RESOURCE POOL adhoc_query ;
 CREATE USER shong RESOURCE POOL adhoc_query ;
 CREATE USER ssharma RESOURCE POOL adhoc_query ;
 CREATE USER sshin RESOURCE POOL adhoc_query ;
 CREATE USER sswami RESOURCE POOL adhoc_query ;
 CREATE USER sv7104 RESOURCE POOL adhoc_query ;
 CREATE USER szavgorodni RESOURCE POOL adhoc_query ;
 CREATE USER tetl RESOURCE POOL batch_platform ;
 CREATE USER thui RESOURCE POOL adhoc_query ;
 CREATE USER vertica RESOURCE POOL general ;
 CREATE USER verticaetl RESOURCE POOL general ;
 CREATE USER vpatel RESOURCE POOL adhoc_query ;
 CREATE USER vs7668 RESOURCE POOL adhoc_query ;
 CREATE USER wtheisinger RESOURCE POOL adhoc_query ;
 CREATE USER xxia RESOURCE POOL adhoc_query ;
 CREATE USER ym154p RESOURCE POOL adhoc_query ;
(66 rows)

       ?column?        
-----------------------
 -- Add users to roles
(1 row)

                                                                                                                                                                                                      ?column?                                                                                                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 GRANT  TO ah5454;
 GRANT  TO bizi;
 GRANT  TO gridprod;
 GRANT  TO jbdair;
 GRANT  TO khaq;
 GRANT  TO pdsqa;
 GRANT  TO pvenkatesan;
 GRANT  TO schaudhuri;
 GRANT  TO shong;
 GRANT  TO sshin;
 GRANT  TO tetl;
 GRANT  TO vpatel;
 GRANT WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO gj870q;
 GRANT WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO gridappsro;
 GRANT WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO ja5058;
 GRANT WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO mm9239;
 GRANT WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO szavgorodni;
 GRANT WebanalyticsDW_ro, pdrstag_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO abalsim;
 GRANT WebanalyticsDW_ro, pdrstag_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO jstooksberry;
 GRANT WebanalyticsDW_ro, pdrstag_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO thui;
 GRANT WebanalyticsDW_ro, pdrstag_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro TO xxia;
 GRANT all_schema_readonly TO adasoar;
 GRANT all_schema_readonly TO ideck;
 GRANT all_schema_readonly TO kdaman;
 GRANT all_schema_readonly TO ny6877;
 GRANT all_schema_readonly TO ym154p;
 GRANT dbduser*, dbadmin*, pseudosuperuser* TO vertica;
 GRANT dbduser, WebanalyticsDW_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ext_ro, dbduser_role TO wtheisinger;
 GRANT dbduser, pseudosuperuser, dbduser_role TO dbd;
 GRANT pdsplatform_ro TO jp0600;
 GRANT pdsplatform_wo TO pdsplatform;
 GRANT pseudosuperuser TO csdw;
 GRANT pseudosuperuser TO dbdb;
 GRANT pseudosuperuser TO edw;
 GRANT pseudosuperuser TO pds_monitoring;
 GRANT pseudosuperuser TO verticaetl;
 GRANT pseudosuperuser, WebanalyticsDW_ro, pdrstag_ro, pdrmonitor_ro, pdrextracts_ro, csdw_stag_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, dbduser_role TO aw110f;
 GRANT pseudosuperuser, pdstest_role TO pdstest;
 GRANT tmp_wo, all_schema_readonly TO pvijayvargiya;
 GRANT uat_ro TO js4738;
 GRANT ypa_ro TO ar4448;
 GRANT ypa_ro TO jd5409;
 GRANT ypa_ro TO rs7644;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro TO jc2746;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro TO jl2978;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro TO klin;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro TO sswami;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro, all_schema_readonly TO ps0301;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro, pdsplatform_wo TO jbrinker;
 GRANT ypa_ro, stg_ro, map_ro, tmp_ro, ext_ro, pdsplatform_wo, dbduser_role TO bmajeska;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO ac6429;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO clin;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO estetzler;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO glangewisch;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO ia1521;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO jbuslon;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO jd1509;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO rp9686;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO ssharma;
 GRANT ypa_ro, tmp_ro, tmp_wo, uat_ro TO vs7668;
 GRANT ypa_ro, uat_ro TO rd0878;
 GRANT ypc_bi_report_temp_ro, ypc_bi_audit_ro, WebanalyticsDW_ro, csdw_etl_ro, bi_sysinfo_ro, pdrstag_ro, gridprod_ro, pdrmonitor_ro, pdrtemp_ro, pdrextracts_ro, csdw_stag_ro, bi_logstore_ro, wadw_stag_ro, SEM_ro, pdsqa_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ypc_bi_report_ro, pdrbackup_ro, ypa_ro, stg_ro, pdrtemp_wo, map_ro, tmp_ro, tmp_wo, stg_wo, edw_ro TO ja9408;
 GRANT ypc_bi_report_temp_ro, ypc_bi_audit_ro, WebanalyticsDW_ro, csdw_etl_ro, bi_sysinfo_ro, pdrstag_ro, pdrmonitor_ro, pdrtemp_ro, pdrextracts_ro, csdw_stag_ro, bi_logstore_ro, wadw_stag_ro, pdsqa_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ypc_bi_report_ro TO jlemen;
 GRANT ypc_bi_report_temp_ro, ypc_bi_audit_ro, WebanalyticsDW_ro, csdw_etl_ro, bi_sysinfo_ro, pdrstag_ro, pdrmonitor_ro, pdrtemp_ro, pdrextracts_ro, csdw_stag_ro, bi_logstore_ro, wadw_stag_ro, pdsqa_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ypc_bi_report_ro, ypa_ro, stg_ro, pdrtemp_wo, tmp_ro, tmp_wo TO klee;
 GRANT ypc_bi_report_temp_ro, ypc_bi_audit_ro, WebanalyticsDW_ro, csdw_etl_ro, bi_sysinfo_ro, pdrstag_ro, pdrmonitor_ro, pdrtemp_ro, pdrextracts_ro, csdw_stag_ro, bi_logstore_ro, wadw_stag_ro, pdsqa_ro, csdw_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ypc_bi_report_ro, ypa_ro, stg_ro, pdrtemp_wo, tmp_ro, tmp_wo, pdsqa_wo TO sv7104;
 GRANT ypc_bi_report_temp_ro, ypc_bi_audit_ro, WebanalyticsDW_ro, pdrmonitor_ro, pdrtemp_ro, pdrmapping_ro, WebAnalyticsDWng_ro, WebAnalyticsDWng_Dim_ro, ypc_bi_report_ro TO bo;
(66 rows)

