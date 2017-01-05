INPUT=karate.adjlist
OUTPUT=karate.ebd

rm -rf logs &&
mkdir -p logs &&
docker run -v `pwd`/share:/usr/share deepwalk:latest \
python /usr/deepwalk/deepwalk \
--format adjlist \
--input /usr/share/$INPUT \
--output /usr/share/$OUTPUT > logs/stdout 2> logs/stderr && \
DW_STDOUT=`cat logs/stdout` && \
DW_STDERR=`cat logs/stderr` && \
curl -s --user 'api:key-xxx' \
    https://api.mailgun.net/v3/xxx.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@xxx.mailgun.org>' \
    -F to='Kilian Ollivier <xxx@xxx.com>' \
    -F subject='Deepwalk' \
    -F text="The computation of $OUTPUT just ended.

stdout : 
$DW_STDOUT

stderr : 
$DW_STDERR"
