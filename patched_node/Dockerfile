FROM ubuntu as build

RUN apt-get update
RUN apt-get -y install python3 g++ make python3-pip wget ninja-build git
RUN git clone https://github.com/nodejs/node.git

WORKDIR /node
RUN git checkout tags/v20.2.0

COPY openssl.patch /node/
RUN git apply openssl.patch

RUN ./configure --ninja
RUN make

FROM ubuntu

COPY --from=build /node/out/Release/node /usr/local/bin/

CMD ["node"]