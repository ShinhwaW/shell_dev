#!/bin/sh

# the shell purpose : send email and sms template funcions

apppath=/app/umapp/umapp/apps/umobile/lib
conn_logpath=/app/umapp/crontab_shell/connection_db/logs

conn_log_name="connection_db.log"
conn_running_date=`date "+%Y-%m-%d %H:%M:%S"`
conn_shell_name=`basename $0`
echo "----${conn_shell_name}-----running time : ${conn_running_date}------------" >>${conn_logpath}/${conn_log_name}


#setup env variable
export PATH=${PATH}:/usr/lib64/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:
#parse the password
export CLASSPATH=${CLASSPATH}:${apppath}/umobile.jar:${apppath}/integration-umobile.jar:${apppath}/appframe.jar

. /app/umapp/crontab_shell/connection_db/config/server_list.txt

USERNAME=mysql
TMP_PASWD=******
PASSWORD=$(java com.asiainfo.um.adapter.util.ExtraInfoToBiCipherUtil ${TMP_PASWD})

DB_CONNECTION_BASE="mysql -N -r -B -h${HOST_BASE} -u${USERNAME} -p${PASSWORD} -P${BASE_PORT} ${DB_BASE} -e"
DB_CONNECTION_CS="mysql -N -r -B -h${HOST_CS} -u${USERNAME} -p${PASSWORD} -P${CS_PORT} ${DB_CS} -e"
DB_CONNECTION_INTEGRATION="mysql -N -r -B -h${HOST_INTEGRATION} -u${USERNAME} -p${PASSWORD} -P${INTEGRATION_PORT} ${DB_INTEGRATION} -e"
DB_CONNECTION_SO1="mysql -N -r -B -h${HOST_SO1} -u${USERNAME} -p${PASSWORD} -P${SO1_PORT} ${DB_SO1} -e"
DB_CONNECTION_COMFRAME30="mysql -N -r -B -h${HOST_COMFRAME30} -u${USERNAME} -p${PASSWORD} -P${COMFRAME30_PORT} ${DB_COMFRAME30} -e"
DB_CONNECTION_AMS1="mysql -N -r -B -h${HOST_AMS1} -u${USERNAME} -p${PASSWORD} -P${AMS1_PORT} ${DB_AMS1} -e"
DB_CONNECTION_SEC="mysql -N -r -B -h${HOST_SEC} -u${USERNAME} -p${PASSWORD} -P${SEC_PORT} ${DB_SEC} -e"

conn_complete_date=`date "+%Y-%m-%d %H:%M:%S"`
echo "---${conn_shell_name}------complete time : ${conn_complete_date}------------" >>${conn_logpath}/${conn_log_name}



