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

generate_json_rows $1 'fixtures/pt2.json'
echo "added $1 patients"

