FROM debian:buster

#RUN apt update
#RUN apt install wget software-properties-common
#RUN wget https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tar.xz
#RUN tar -xf Python-3.11.1.tar.xz
#RUN cd Python-3.11.1
#RUN ./configure --enable-optimizations
#RUN make altinstall

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        libsqlite3-dev \
        libbz2-dev \
        wget \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get purge -y imagemagick imagemagick-6-common

RUN cd /usr/src \
    && wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz \
    && tar -xzf Python-3.11.0.tgz \
    && cd Python-3.11.0 \
    && ./configure --enable-optimizations \
    && make altinstall

RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.11 1

RUN mkdir -p tools/site-files
COPY ./tools/site-files ./tools/site-files
#CMD ["python", "pip", "install", "--no-cache-dir", "-r", "./tools/site-files/requirements.txt"]

WORKDIR ./tools/site-files

#RUN python
RUN python -m pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "main.py"]