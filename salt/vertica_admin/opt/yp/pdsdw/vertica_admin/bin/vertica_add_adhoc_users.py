#!/usr/bin/python

import argparse
import yaml

def parse_arguments():
    parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                     description='PDS Vertica User Administration Tool.')

    parser.add_argument('-A', '--app_path', help='Required: Path to application folder, e.g.:/opt/yp/pdsdw/vertica_admin/', default='/opt/yp/pdsdw/vertica_admin', required=False)
    parser.add_argument('-W', '--work_path', help='Optional: Workspace directory (defaults: /opt/yp/pdsdw/vertica_admin/sql/', default='/opt/yp/pdsdw/vertica_admin/sql', required=False)
    parser.add_argument('-C', '--cluster', help='Required: Cluster name (qe/stage/prod/newt/newton)', required=True)
    parser.add_argument('-u', '--user_type', help='Required: User type (e.g.: adhoc/role) (default: adhoc)', default='adhoc', required=True)
    return parser.parse_args()

def generate_user_create_sql():
    print("hello")
#    def __init__(self, app_path, work_path, cluster_name, app_config):
        

def main():
    args = parse_arguments()
    
    application_path = args.app_path
    work_path = args.work_path
    application_config = args.app_config
    cluster_name = args.cluster
    config_filename = "%s_adhoc_users.yaml" % (cluster_name)
    

    with open(application_path + "/conf/" + config_filename, 'r') as ymlfile:
        print ymlfile
        adhoc_users_cfg = yaml.load(ymlfile)
    

if __name__ == "__main__":
     main()
     gen_user_admin = generate_user_admin_sql(application_path, work_path, cluster_name, application_config)
     


