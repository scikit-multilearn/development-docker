FROM ubuntu:16.10

MAINTAINER Scikit-multilearn Team "scikit-multilearn-dev@googlegroups.com"
RUN apt-get update -y
RUN apt-get install -y dirmngr software-properties-common wget


RUN add-apt-repository ppa:webupd8team/java -y  
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections

RUN echo deb http://downloads.skewed.de/apt/yakkety yakkety universe >> /etc/apt/sources.list
RUN echo deb-src http://downloads.skewed.de/apt/yakkety yakkety universe >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 92F371361A7ECE03

RUN apt-get update -y

# for python 2.2
RUN apt-get install --allow-unauthenticated -y python-graph-tool oracle-java8-installer python-pip python-dev build-essential less libxml2-dev libz-dev

RUN pip install --upgrade pip 

RUN pip install liac-arff igraph numpy nose pylint scipy scikit-learn sphinx sphinx_rtd_theme sphinx_pypi_upload whichcraft future python-igraph

ADD setup /usr/local/bin/

RUN chmod 755 /usr/local/bin/setup

RUN apt-get install -y ruby ruby-dev make gcc

RUN gem install jekyll bundler

RUN wget https://adams.cms.waikato.ac.nz/snapshots/meka/meka-snapshot.zip -O /opt/meka.zip && cd /opt/ && unzip meka.zip && rm -rf meka.zip && mv meka* meka

ENTRYPOINT ["/usr/local/bin/setup"]
