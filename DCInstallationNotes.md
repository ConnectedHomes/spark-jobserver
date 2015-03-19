Overview
--------

For installing the Spark Job Server on the BGCH Data cente, the debian package must be downloaded from the dist server. 
The DP Jenkins regularly builds and publishes the debian package to the dist server.

After the deb file is installed, the Spark Job Server is installed in `/opt/spark-job-server` and the required softlinks are created for the service, logrotate 
and man files. The configuration file for the job server is located at `/opt/spark-job-server/job-server-default.conf` which 
is currently managed by the debian package BUT ideally should be managed by the puppet.

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
