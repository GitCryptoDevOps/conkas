# Docker Image with conkas

# Pull base image
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3-pip
RUN apt-get autoremove -y
RUN apt-get clean

ENV LC_ALL C.UTF-8

RUN pip3 --no-cache-dir install --upgrade setuptools pip

COPY . /conkas/

WORKDIR /conkas

RUN pip3 install -r requirements.txt

RUN pip3 install solc-select
COPY ./install-solc.sh .
RUN ./install-solc.sh
COPY ./conkas.sh /usr/local/bin/conkas

#ENTRYPOINT ["python3", "conkas.py"]
