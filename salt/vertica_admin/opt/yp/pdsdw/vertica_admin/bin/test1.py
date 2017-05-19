#!/usr/bin/python

import yaml

dict = {'aw110f': {'resource_pool': 'adhoc_query', 'authentication': ['v_trust_local', 'v_ldap1', 'v_ldap2', 'v_host_gss'], 'role': ['pseudosuperuser', 'WebanalyticsDW_ro', 'pdrstag_ro', 'pdrmonitor_ro', 'pdrextracts_ro', 'csdw_stag_ro', 'csdw_ro', 'pdrmapping_ro', 'WebAnalyticsDWng_ro', 'WebAnalyticsDWng_Dim_ro'], 'schema': None}, 'thui': {'resource_pool': 'adhoc_query', 'authentication': ['v_trust_local', 'v_ldap1', 'v_ldap2'], 'role': ['pseudosuperuser', 'WebanalyticsDW_ro', 'pdrstag_ro', 'pdrmonitor_ro', 'pdrextracts_ro', 'csdw_stag_ro', 'csdw_ro'], 'schema': None}}

print dict.keys()
for user in dict.keys():
    user_resource_pool = dict[user]['resource_pool']
    user_authentication = dict[user]['authentication']
    user_role = dict[user]['role']
    user_schema = dict[user]['schema']

#print dict['aw110f'].keys()
#print
#print dict['aw110f']
#print
#print dict['aw110f']['resource_pool']
#print 
#print dict['aw110f']['authentication']
#print 
#print ",".join(dict['aw110f']['authentication'])
#print
#print
#print dict['thui'].keys()
#print
#print dict['thui']
#print
#print dict['thui']['resource_pool']
#print 
#print dict['thui']['authentication']
#print 
a = ",".join(dict['thui']['authentication'])
print a
#
