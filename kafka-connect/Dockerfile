FROM kafka:latest

COPY connect-standalone.properties /opt/kafka/config/
COPY connect-file-source.properties /opt/kafka/config/
COPY start-kafka.sh /
COPY my-source-file.txt /tmp/my-source-file.txt
COPY jmx_exporter_config.yml /opt/kafka/config/jmx_exporter_config.yml

CMD ["/start-kafka.sh"]
