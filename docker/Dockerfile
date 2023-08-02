FROM nvidia/cuda:11.7.1-runtime-ubuntu20.04

RUN apt-get update -y && apt-get install -y python3.9 python3.9-distutils curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py
RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.9 /usr/bin/python3
RUN apt-get install screen -y
RUN pip3 install scipy transformers fschat bitsandbytes
