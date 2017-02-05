===============================
DeepWalk Docker
===============================
forked from https://github.com/phanein/deepwalk

Launch deepwalk in a docker image, then launch an email when the computation is finished.

* Create a shared volume in the root directory :
``mkdir share``

* Put the graph in shared
``share/graph.edgelist``

* Build the docker image :
``./build-docker.sh``

* Edit the parameters for deepwalk and mailgun in run-docker.sh

* Then run the docker image :
``./run-docker.sh``
