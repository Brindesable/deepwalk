docker run -v `pwd`/share:/usr/share deepwalk:latest \
python /usr/deepwalk/deepwalk \
--format adjlist \
--input /usr/share/karate.adjlist \
--output /usr/share/karate.ebd
