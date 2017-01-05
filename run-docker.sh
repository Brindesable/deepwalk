INPUT=karate.adjlist
FORMAT=adjlist
OUTPUT=karate.ebd
NB_WALKS=10
REP_SIZE=64
WINDOW_SIZE=5
WORKERS=1

DATE=`date '+%d-%m-%Y_%H-%M-%S'`
mkdir -p share/$DATE &&
docker run -v `pwd`/share:/usr/share deepwalk:latest \
python /usr/deepwalk/deepwalk \
--format $FORMAT \
--number-walks $NB_WALKS \
--representation-size $REP_SIZE \
--window-size $WINDOW_SIZE \
--workers $WORKERS \
--input /usr/share/$INPUT \
--output /usr/share/$DATE/$OUTPUT > share/$DATE/stdout 2> share/$DATE/stderr && \
DW_STDOUT=`cat share/$DATE/stdout` && \
DW_STDERR=`cat share/$DATE/stderr` && \
curl -s --user 'api:key-xxx' \
    https://api.mailgun.net/v3/xxx.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@xxx.mailgun.org>' \
    -F to='Kilian Ollivier <xxx@xxx.com>' \
    -F subject='Deepwalk' \
    -F text="The computation of $OUTPUT just ended.
    
directory :
$DATE    

stdout : 
$DW_STDOUT

stderr : 
$DW_STDERR"
