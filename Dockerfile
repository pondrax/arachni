FROM debian:bullseye-slim

ARG VERSION=1.6.1.3
ARG WEB_VERSION=0.6.1.1

RUN apt-get update 
RUN apt-get install -y \
    ca-certificates \
    wget
#RUN apt-get install -y libc6 libcrypt1 libcurl4

#RUN apt-get -qq install -y --no-install-recommends wget ca-certificates && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists
 
RUN useradd -ms /bin/bash arachni
RUN mkdir /arachni
RUN wget https://github.com/Arachni/arachni/releases/download/v${VERSION}/arachni-${VERSION}-${WEB_VERSION}-linux-x86_64.tar.gz \
    | tar xvz -C /arachni --strip-components=1
RUN chown arachni:arachni /arachni
   
USER arachni
WORKDIR /arachni

EXPOSE 9292
