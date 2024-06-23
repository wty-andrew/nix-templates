FROM gcc:latest

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y cmake libgtest-dev libgmock-dev

ARG PROJECT=myapp

COPY . /usr/src/${PROJECT}

WORKDIR /usr/src/${PROJECT}

RUN mkdir build && cd build \
 && cmake .. \
 && make \
 && ctest

ENTRYPOINT ["/bin/bash"]
