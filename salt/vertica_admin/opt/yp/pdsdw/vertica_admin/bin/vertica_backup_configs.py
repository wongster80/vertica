#!/usr/bin/python

import yaml
import argparse, subprocess, re, os
from subprocess import PIPE
#from os import path, open


def parse_arguments():
    """Parse arguments"""
    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                     description='PDS Vertica Configuration Backup Administration Tool.')

    parser.add_argument('-A', '--app_path', help='Required: Path to application folder, e.g.:/opt/yp/pdsdw/vertica_admin/', default='/opt/yp/pdsdw/vertica_admin', required=False)
    parser.add_argument('-W', '--work_path', help='Optional: Workspace directory (defaults: /opt/yp/pdsdw/vertica_admin/sql/)', default='/opt/yp/pdsdw/vertica_admin/sql', required=False)
    parser.add_argument('-L', '--log_path', help='Optional: Log directory (defaults: /opt/yp/pdsdw/vertica_admin/var/log/)', default='/opt/yp/pdsdw/vertica_admin/var/log', required=False)
    parser.add_argument('-B', '--backup_path', help='Optional: Backup directory (defaults: /opt/yp/pdsdw/vertica_admin/vertica-backup/)', default='/opt/yp/pdsdw/vertica_admin/vertica-backup', required=False)
    parser.add_argument('-C', '--cluster', help='Required: Cluster name (qe/stage/prod/newt/newton)', required=True)
    return parser.parse_args()

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
    #print vertica_vip,vertica_host, vertica_user, vertica_password
    return (vertica_vip, vertica_host, vertica_user, vertica_password)

def yaml_dump(filepath, data):
    """Dumps data to yaml file"""
    with open(filepath, "w") as file_descriptor:
        yaml.dump(data, file_descriptor)

def get_admin_sql_scripts():
    """ Return list of backup sql files to run """
    sql_dir_files = os.listdir(work_path)
    
    backup_sql_scripts = []
    for files in sql_dir_files:
        if files.endswith("_backup.sql"):
            backup_sql_scripts.append(files)
    
#     print type(backup_sql_scripts)
#     print backup_sql_scripts
    return backup_sql_scripts


def run_backup_sql(sql_list):
    """ Run SQL backup sql scripts """
    for sql in sql_list:
        sql_admin_script = "{0}/{1}".format(work_path, sql)
        sql_backup_file = "{0}/{1}".format(cluster_backup_path, sql)
        app_log_file = "{0}/{1}_{2}.out".format(log_path, cluster_name, sql)
        #print vertica_user, vertica_password, vertica_vip, vertica_host, app_log_file
        print "Executing VSQL file... %s" % (sql_admin_script)
        if sql.endswith("authentication_backup.sql"):
            vsql_cmd = [ vsql, '-At', '-U', 'vertica', '-h', vertica_host, '-f', sql_admin_script , '-o', sql_backup_file ]
        else:
            vsql_cmd = [ vsql, '-At', '-U', vertica_user, '-h', vertica_vip, '-f', sql_admin_script , '-o', sql_backup_file ]
        logFile = open(app_log_file, "a")
        run_vsql = subprocess.Popen( vsql_cmd, stdout=logFile, stderr=logFile )
        p_status = run_vsql.wait()

def finalize_sql_script():
    """ Concatenate SQL script to finalize SQL """
    sql_files = ['schema_backup.sql', 'resource_pools_backup.sql', 'storage_locations_backup.sql', 'authentication_backup.sql', 'roles_backup.sql', 'users_backup.sql', 'roleusers_backup.sql', 'grant_schema_backup.sql', 'grant_resource_pools_backup.sql', 'grant_roles_backup.sql', 'grant_authentication_backup.sql', 'grant_roles_backup.sql', 'running_config_params_backup.sql']

    print '--- Aggregate all VSQL scripts ---'
    with open('{0}/admin_configurations.sql'.format(cluster_backup_path), 'w') as outfile:
        for sql in sql_files:
            sql_backup_file = "{0}/{1}".format(cluster_backup_path, sql)
            with open(sql_backup_file) as infile:
                for line in infile:
                    outfile.write(line)

if __name__ == "__main__":
    vertica_vip = ""
    vertica_host = ""
    vertica_user = ""
    vertica_password = ""
    args = parse_arguments()

    application_path = args.app_path
    work_path = args.work_path
    log_path = args.log_path
    backup_path = args.backup_path
    application_config_path = "%s/conf" % (application_path)
    cluster_name = args.cluster
    #config_filename = "%s_%s_users.yml" % (cluster_name, user_type)
    cluster_backup_path = "{0}/{1}".format(backup_path, cluster_name)

    vsql = "/opt/vertica/bin/vsql"
    
    env_profile_data = env_yaml_loader()
    set_vertica_config(env_profile_data)
    #print users_profile_data
    admin_sql_scripts = get_admin_sql_scripts()
    run_backup_sql(admin_sql_scripts)
    finalize_sql_script()

        
