#!/bin/bash


# Script to commit changes from the vertica-backup directory

VERTICA_BACKUP_DIR='/opt/yp/pdsdw/vertica_admin/vertica-backup'
VERTICA_ADMIN_LOGS_DIR='/opt/yp/pdsdw/vertica_admin/var/log'
cd $VERTICA_BACKUP_DIR;
/usr/bin/git status >> ${VERTICA_ADMIN_LOGS_DIR}/vertica-backup-git-status.log 2>&1
/usr/bin/git add --all >> ${VERTICA_ADMIN_LOGS_DIR}/vertica-backup-git-status.log 2>&1
/usr/bin/git commit --all -m 'Vertica cluster configuration backup'
/usr/bin/git push >> ${VERTICA_ADMIN_LOGS_DIR}/vertica-backup-git-status.log 2>&1


