FROM zabbix/zabbix-appliance:ubuntu-latest
RUN apt-get update; apt-get full-upgrade -y
WORKDIR
EXPOSE 80 10050 161
ENTRYPOINT
