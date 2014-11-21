################################################################################
# set require variables.
################################################################################
DIRECTORY=$(dirname $0)
BASENAME=$(basename $0)

PGHOME="??"
PGHOST="localhost"
PGPORT="5433"
PGUSER="fhirbase"
PGPASSWORD="fhirbase"
PGDATABASE="fhirbase"

PGBIN="/usr/ppas-9.3/bin"

################################################################################
# source library files
################################################################################
source ${DIRECTORY}/lib/pg_func_lib.sh
source ${DIRECTORY}/lib/fhir_func_lib.sh

##

generate_search_sql $1 'search_patients.sql'
start_time=$(get_timestamp_nano)
psql -qAt -p ${PGPORT} -h ${PGHOST} -d ${PGDATABASE} -U ${PGUSER} ${PGPASSWORD} --single-transaction -f 'search_patients.sql'
end_time=$(get_timestamp_nano)
total_time="$(get_timestamp_diff_nano "${end_time}" "${start_time}")"
echo "searched $1 times, it took ${total_time} nanosec"

