The Spark Job Server service provides a RESTful interface to run Spark jobs on a Spark cluster. The original project is a open source project 
[here](https://github.com/spark-jobserver/spark-jobserver) which is forked for BGCH [here](https://github.com/ConnectedHomes/spark-jobserver).

Spark Job Server is installed in /opt/spark-job-server and the HTTP server starts up the server on port 8090.
`curl localhost:8090`

Configurations for the service are in the /opt/spark-job-server/job-server-defaults.conf. The configuration file contains an entry for Spark master which is defaulted to `localhost` but can be changed to the Spark master of the cluster.

Troubleshooting Tips