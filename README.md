# RASSP Docker

This is a docker image for a RASSP node. For more info about RASSP check https://bitbucket.org/dataengineering/rassp/.

To create a RASSP cluster first create a Java Key Store for each RASSP node named `keystore.jks`. All the public keys created must be imported in the `truststore.jsk` store. The `truststore.jsk` in this repository already contains some public keys used for an experimental deployment. This file can be replaced with the created `truststore.jsk`. The keystore and truststore usernames and passwords  are defined in the `application.conf` file.

Also you need to create a file containing the RASSP dataset and name it `User.json`.

The RASSP nodes by default use port `8080` to communicate. The port can be defined in the section bellow

```
akka {
  ...
  remote {
  ...
    netty.ssl = {
    ...
        port = 8080
    ...
    }
    ...
  }
  ...
}
```
in the `application.conf` file. In this document examples use the default port.

To build this image first clone this repository and in the cloned directory issue
`docker build -t rassp .`

To deploy a RASSP node issue the following command
`docker run -d -p 8080:2552 -v /path/to/keystore:/root/keystore -v /path/to/dataset:/root/dbFiles -e HOSTNAME=HOST_IP -e GROUP_PROXIES=\"akka.ssl.tcp://benaloh@PROXY_IP1:8080\",\"akka.ssl.tcp://benaloh@PROXY_IP2:8080\"  -e SEED_NODE=SEED_IP -e PEERS=\"akka.ssl.tcp://benaloh@IP1:8080\",\"akka.ssl.tcp://benaloh@IP2:8080\",\"akka.ssl.tcp://benaloh@IP3:8080\" rassp`

where:
* `/path/to/keystore` the directory containing the `keystore.jks`
* `/path/to/dataset/` the directory containing the dataset `User.json`
* `HOST_IP` the IP of the host machine
* `SEED_IP` the akka cluster seed node IP
* `PROXY_IP{n}` the IPs of the RASSP node that act as group proxies
* `IP{n}` the IPs of the rest of the nodes in the group
