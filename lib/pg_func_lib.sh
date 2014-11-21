# some code was taken from https://github.com/EnterpriseDB/pg_nosql_benchmark
# thus the Copyright statement
#
#!/bin/bash

################################################################################
# Copyright EnterpriseDB Cooperation
# All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in
#      the documentation and/or other materials provided with the
#      distribution.
#    * Neither the name of PostgreSQL nor the names of its contributors
#      may be used to endorse or promote products derived from this
#      software without specific prior written permission.
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#  Author: Vibhor Kumar
#  E-mail ID: vibhor.aim@gmail.com



################################################################################
# function: print messages with process id
################################################################################
function process_log()
{
   echo "PID: $$ [RUNTIME: $(date +'%m-%d-%y %H:%M:%S')] ${BASENAME}: $*" >&2
}

################################################################################
# function: get_timestamp_in_nanoseconds
################################################################################
function get_timestamp_nano ()
{
    echo $(date +"%F %T.%N")
}


################################################################################
# function: get_timestamp_diff_nanoseconds
################################################################################
function get_timestamp_diff_nano ()
{
     typeset -r F_TIMESTAMP1="$1"
     typeset -r F_TIMESTAMP2="$2"
     local SECONDS_DIFF
     local NANOSECONDS_DIFF
     local SECONDS_NANO

     SECONDS_DIFF=$(echo $(date -d "${F_TIMESTAMP1}" +%s) \
                      -  $(date -d "${F_TIMESTAMP2}" +%s)|bc)
     NANOSECONDS_DIFF=$(echo $(date -d "${F_TIMESTAMP1}" +%N) \
                          -  $(date -d "${F_TIMESTAMP2}" +%N)|bc)
     SECONDS_NANO=$(echo ${SECONDS_DIFF} \* 1000000000|bc)
     printf "%d\n" $(((${SECONDS_NANO}  + ${NANOSECONDS_DIFF})))
}


###############################################################################
# function: generate_json_rows
################################################################################
function generate_json_rows ()
{
   typeset -r NO_OF_ROWS="$1"
   typeset -r FILENAME="$2"

   rm -rf ${FILENAME}
   process_log "creating json data."
   NO_OF_LOOPS=${NO_OF_ROWS}
   for ((i=0;i<${NO_OF_LOOPS};i++))
   do
       patient_json_seed_data $i >${FILENAME}
       cat insert_patient_test.sql | psql -p ${PGPORT} -h ${PGHOST} -d ${PGDATABASE} -U ${PGUSER}
   done
}

################################################################################
# function: patient_search_sql
################################################################################
function patient_search_sql ()
{

     local INDX="$1"
     local SEED_DATA

     if [[ ${INDX} -eq 0 ]]
     then
         INDX=1
     fi
      SEARCH_SQL="select fhir_search(('{\"base\":\"https://test.me\"}')::jsonb, 'Patient', 'name=\"given1$((${RANDOM}/$INDX + $INDX ))\"');"

  echo "${SEARCH_SQL}"
}

###############################################################################
# function: generate_search_sql
################################################################################
function generate_search_sql ()
{
   typeset -r NO_OF_ROWS="$1"
   typeset -r FILENAME="$2"

   rm -rf ${FILENAME}
   process_log "creating search sql file."
   NO_OF_LOOPS=${NO_OF_ROWS}
   for ((i=0;i<${NO_OF_LOOPS};i++))
   do
       patient_search_sql $i >>${FILENAME}
   done
}


################################################################################
# run_sql_file: send SQL from a file to database
################################################################################
function run_sql_file ()
{
   typeset -r F_PGHOST="$1"
   typeset -r F_PGPORT="$2"
   typeset -r F_DBNAME="$3"
   typeset -r F_PGUSER="$4"
   typeset -r F_PGPASSWORD="$5"
   typeset -r F_SQLFILE="$6"

   export PGPASSWORD="${F_PGPASSWORD}"
   ${PGHOME}/bin/psql -qAt -h ${F_PGHOST} -p ${F_PGPORT} -U ${F_PGUSER} \
                  --single-transaction -d ${F_DBNAME} -f "${F_SQLFILE}"
}