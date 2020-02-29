# Kafka Connect JMX Prometheus Exporter

This repo contains Kafka, Kafka Connect, Hazelcast and Prometheus containers. JMX metrics from Kafka Connect service are exposed with the prometheus jmx exporter. Hazelcast built-in JMX Prometheus Agent is also tested for JMX and JMX Hazelcast metrics.

# Kafka Connect
Kafka Connect service is configured as FileStream Source Connector using a Kafka base image with the prometheus jmx exporter installed.

# JMX
JMX options can be customized using the `KAFKA_JMX_OPTS` and `KAFKA_OPTS` environment variables. 
 
# Prometheus
Prometheus metrics will be exported on port 9090. The jmx metrics that are exported are those that match the patterns in the `jmx_exporter_config.yml` config.

# Deployment
* Build the custom docker image locally: `docker-compose build`
* Run `docker-compose up -d` will run the containers in background
* Attach a console consumer to the topic to consume when new messages are published to it:
```
docker exec -it kafka /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic simple-connect --from-beginning
```
* Check Prometheus dashboard for Kafka Connect JMX metrics: `localhost:9090`
