FROM jupyter/minimal-notebook:latest

USER root
RUN apt-get update &&  apt-get upgrade -y && \
    apt-get install -y apt-utils  wget libcurl4-gnutls-dev && \
    wget ftp://ftp.renci.org/pub/irods/releases/4.1.3/ubuntu14/irods-icommands-4.1.3-ubuntu14-x86_64.deb -O /tmp/icommands.deb &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y `dpkg -I /tmp/icommands.deb | sed -n 's/^ Depends: //p' | sed 's/,//g'` && \
    dpkg -i /tmp/icommands.deb && rm /tmp/icommands.deb

CMD ["start-notebook.sh", "--NotebookApp.token=''"]
