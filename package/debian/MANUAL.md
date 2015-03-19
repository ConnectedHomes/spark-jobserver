Overview
--------

The Spark Job Server service provides a RESTful interface to run Spark jobs on a Spark cluster. The original project is a open source project 
[here](https://github.com/spark-jobserver/spark-jobserver) which is forked for BGCH [here](https://github.com/ConnectedHomes/spark-jobserver).

Spark Job Server is installed in /opt/spark-job-server and the HTTP server starts up the server on port 8090.
`curl localhost:8090`

Configurations for the service are in the /opt/spark-job-server/job-server-defaults.conf. The configuration file contains an entry for Spark master which is defaulted to `localhost` but can be changed to the Spark master of the cluster.

Configurations 
--------------
All these configurations are in the `/opt/spark-job-server/job-server-default.conf`

- Location of the Spark master on the cluster

  ```javascript
  spark { 
    master = "spark://127.0.0.1:7077" 
  }
  ```

- Maximum sized jars which can be uploaded to the job-server.

  ```javascript
  spray.can.server { 
    parsing.max-content-length = 64m 
  }
  ```
  
- Location for storing the job-server metadata

  ```javascript
  jobserver {
    port = 8090
    jar-store-rootdir = /var/lib/spark-job-server/jars

    jobdao = spark.jobserver.io.JobFileDAO

    filedao {
      rootdir = /var/lib/spark-job-server/filedao/data
    }
  }
  ```
  
- Default context settings

  ```javascript
  context-settings {
    num-cpu-cores = 2           # Number of cores to allocate.  Required.
    memory-per-node = 512m
  }
  ```
  
Troubleshooting Tips
--------------------
