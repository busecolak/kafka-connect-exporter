FROM maven:3.6.3-jdk-8-slim AS build

ARG JMX_EXPORTER_VERSION="0.12.0"

RUN apt-get update \
    && apt-get install -qy git \
    && mkdir -p /build \
    && git clone --branch parent-$JMX_EXPORTER_VERSION --depth 1 https://github.com/prometheus/jmx_exporter.git build/jmx_exporter

WORKDIR /build/jmx_exporter

RUN mvn package

FROM wurstmeister/kafka:2.12-2.2.0

ARG JMX_EXPORTER_VERSION="0.12.0"

ENV KAFKA_AUTO_CREATE_TOPICS_ENABLE "false"
ENV KAFKA_LOG_RETENTION_HOURS 24
ENV KAFKA_LOG_DIRS "/kafka/kafka-logs"
ENV KAFKA_RESERVED_BROKER_MAX_ID 2147483647

COPY --from=build /build/jmx_exporter/jmx_prometheus_javaagent/target/jmx_prometheus_javaagent-$JMX_EXPORTER_VERSION.jar /opt/kafka/libs/jmx_prometheus_javaagent.jar
COPY config/jmx_exporter_config.yml /opt/kafka/config/jmx_exporter_config.yml

# below packages are needed for kafka manager (not the one with UI)
RUN apk add gettext libintl nodejs \
    && rm -rf /var/cache/apk/*
