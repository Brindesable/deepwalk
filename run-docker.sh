INPUT=karate.adjlist
OUTPUT=karate.ebd

docker run -v `pwd`/share:/usr/share deepwalk:latest \
python /usr/deepwalk/deepwalk \
--format adjlist \
--input /usr/share/$INPUT \
--output /usr/share/$OUTPUT

curl -s --user 'api:key-xxx' \
https://api.mailgun.net/v3/sandboxxxx.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@sandboxxxx.mailgun.org>' \
    -F to='xxx <xxx@xxx.com>' \
    -F subject='Deepwalk' \
    -F text="The computation of $OUTPUT just ended."
