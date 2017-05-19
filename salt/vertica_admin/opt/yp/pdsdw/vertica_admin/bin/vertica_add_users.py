#!/usr/bin/python

import yaml
import argparse, subprocess, re

def parse_arguments():
    """Parse arguments"""
    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                     description='PDS Vertica User Administration Tool.')

    parser.add_argument('-A', '--app_path', help='Required: Path to application folder, e.g.:/opt/yp/pdsdw/vertica_admin/', default='/opt/yp/pdsdw/vertica_admin', required=False)
    parser.add_argument('-W', '--work_path', help='Optional: Workspace directory (defaults: /opt/yp/pdsdw/vertica_admin/sql/)', default='/opt/yp/pdsdw/vertica_admin/sql', required=False)
    parser.add_argument('-L', '--log_path', help='Optional: Log directory (defaults: /opt/yp/pdsdw/vertica_admin/var/log/)', default='/opt/yp/pdsdw/vertica_admin/var/log', required=False)
    parser.add_argument('-C', '--cluster', help='Required: Cluster name (qe/stage/prod/newt/newton)', required=True)
    parser.add_argument('-u', '--user_type', help='Required: User type (e.g.: adhoc/role) (default: adhoc)', default='adhoc', required=True)
    return parser.parse_args()

def user_yaml_loader():
    """Loads the user config yaml file"""
    with open("{0}/{1}_{2}_users.yml".format(application_config_path, cluster_name, user_type), 'r') as file_descriptor:
        adhoc_users_cfg = yaml.load(file_descriptor)
    return adhoc_users_cfg

def env_yaml_loader():
    """Loads the Vertica cluster config yaml file"""
    with open("{0}/vertica_cluster_config.yml".format(application_config_path), 'r') as file_descriptor:
        vertica_env_cfg = yaml.load(file_descriptor)
    return vertica_env_cfg

def set_vertica_config(vpd):
    """Set Vertica cluster variables from the Vertica cluster config yaml file"""
    global vertica_vip
    global vertica_host
    global vertica_user
    global vertica_password

    print "-- Setting cluster variables --"
    vertica_vip = vpd[cluster_name]['vertica_vip']
    vertica_host = vpd[cluster_name]['vertica_host']
    vertica_user = vpd[cluster_name]['vertica_user']
    vertica_password = vpd[cluster_name]['vertica_password']
    print vertica_vip, vertica_host, vertica_user, vertica_password
    return (vertica_vip, vertica_host, vertica_user, vertica_password)

def yaml_dump(filepath, data):
    """Dumps data to yaml file"""""
    with open(filepath, "w") as file_descriptor:
        yaml.dump(data, file_descriptor)

def generate_sql(upd):
    """Generate SQL and write to file"""

    file = open(sql_output_file, "w")
    
    for user in upd.keys():
        if user == "default":
            print "skipping default"
        else:

            print "-- Creating user {0} --".format(user)
            print "CREATE USER {0} IDENTIFIED BY 'vertica';".format(user)
            file.write("CREATE USER {0} IDENTIFIED BY 'vertica';\n".format(user))

            if users_profile_data[user]['resource_pool']:
                user_resource_pool = ",".join(users_profile_data[user]['resource_pool'])
                print "GRANT USAGE ON RESOURCE POOL {0} TO {1};".format(user_resource_pool, user) 
                print "ALTER USER {1} RESOURCE POOL {0};".format(user_resource_pool, user) 
                file.write("GRANT USAGE ON RESOURCE POOL {0} TO {1};\n".format(user_resource_pool, user))
                file.write("ALTER USER {1} RESOURCE POOL {0};\n".format(user_resource_pool, user))
            if users_profile_data[user]['authentication']:
                user_authentication = ",".join(users_profile_data[user]['authentication'])
                print "GRANT AUTHENTICATION {0} to {1};\n".format(user_authentication, user)
                file.write("GRANT AUTHENTICATION {0} to {1};\n".format(user_authentication, user))
            if users_profile_data[user]['role']:
                user_role = ",".join(users_profile_data[user]['role'])
                print "GRANT {0} to {1};".format(user_role, user)
                print "ALTER USER {1} DEFAULT ROLE {1}\n".format(user_role, user)
                file.write("GRANT {0} to {1};\n".format(user_role, user))
                file.write("ALTER USER {1} DEFAULT ROLE {0};\n".format(user_role, user))
            if users_profile_data[user]['schema']:
                user_schema = ",".join(users_profile_data[user]['schema'])

    file.close()

def run_sql(sqlfile):
    vsql_cmd = [ vsql, '-U', vertica_user, '-h', vertica_vip, '-f', sql_output_file ]
    print vertica_user, vertica_password, vertica_vip, sql_output_file
    print "Executing VSQL file..."
    logFile = open(app_output_file, "a")
#    run_vsql = subprocess.Popen( vsql_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE )
    run_vsql = subprocess.Popen( vsql_cmd, stdout=logFile, stderr=logFile )
    p_status = run_vsql.wait()

if __name__ == "__main__":
    vertica_vip = ""
    vertica_host = ""
    vertica_user = ""
    vertica_password = ""
    args = parse_arguments()

    application_path = args.app_path
    work_path = args.work_path
    log_path = args.log_path
    application_config_path = "%s/conf" % (application_path)
    cluster_name = args.cluster
    user_type = args.user_type
    #config_filename = "%s_%s_users.yml" % (cluster_name, user_type)
    sql_output_file = "{0}/{1}_{2}_create_users.sql".format(work_path, cluster_name, user_type)
    app_output_file = "{0}/{1}_{2}_create_users.out".format(log_path, cluster_name, user_type)

    vsql = "/opt/vertica/bin/vsql"
    
    env_profile_data = env_yaml_loader()
    set_vertica_config(env_profile_data)
    users_profile_data = user_yaml_loader()
    generate_sql(users_profile_data)
    #print users_profile_data
    run_sql(sql_output_file)

        

