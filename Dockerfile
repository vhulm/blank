FROM ubuntu:16.04

COPY ./sources.list /etc/apt/sources.list
RUN apt-get update -yq && apt-get upgrade -yq && apt-get autoremove -yq && apt-get autoclean -yq && apt-get clean -yq

WORKDIR /root/

RUN buildDeps='python3.5 python3-pip net-tools wget vim' \
    && apt-get install -yq $buildDeps \
    && mkdir ~/.pip \
    && echo "[global] \nindex-url = http://mirrors.aliyun.com/pypi/simple/\n\n[install]\ntrusted-host=mirrors.aliyun.com" >> ~/.pip/pip.conf \
    && pip3 install --upgrade pip

