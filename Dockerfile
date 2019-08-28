# Host Image 

FROM ubuntu:18.04

RUN apt update

COPY helloworld.sh /helloworld.sh

CMD ["/helloworld.sh"]
