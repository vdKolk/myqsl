#!/bin/bash

# Change all eMail instances
USER="root"
HOST="127.0.0.1"

LOGFILE="changeMail.log"

declare -a PREFIXES

PREFIXES[0]="7510_"
PREFIXES[1]="avr_"
PREFIXES[2]="cp_"
PREFIXES[3]="gdw_"
PREFIXES[4]="gem_"
PREFIXES[5]="habo_"
PREFIXES[6]="haro_"
PREFIXES[7]="iab_"
PREFIXES[8]="ibr_"
PREFIXES[9]="imp_"
PREFIXES[10]="nhb_"
PREFIXES[11]="noab_"
PREFIXES[12]="nova_"
PREFIXES[13]="nvk_"
PREFIXES[14]="nvr_"
PREFIXES[15]="proc_"
PREFIXES[16]="sca_"
PREFIXES[17]="scuk_"
PREFIXES[18]="sra_"
PREFIXES[19]="svc_"
PREFIXES[20]="svcp_"
PREFIXES[21]="unit4_"
PREFIXES[22]="via_"
#-----------

DBS=`mysql -h $HOST -u$USER -p$MYSQL_ROOT_PASSWORD -e"SHOW DATABASES"`;
for DB in $DBS ;
do
        for ((i=0; i<${#PREFIXES[@]}; i++)); do
                PREFIXLENGTH=${#PREFIXES[i]}
                if [ "${DB:0:PREFIXLENGTH}" = "${PREFIXES[i]}" ]; then
                        echo " " 2>&1 | tee -a $LOGFILE
                        echo "-------------------------------" 2>&1 | tee -a $LOGFILE
                        echo "$DB: " 2>&1 | tee -a $LOGFILE

                        mysql -h $HOST -u$USER -p$PWD $DB -e "UPDATE Users set email = concat(userId, '@scienta.nl') where email NOT LIKE '%syslogic.nl' AND email NOT LIKE '%scienta.nl';" 2>&1 | tee -a $LOGFILE
                fi
        done
done
