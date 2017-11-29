FROM ibmjava:8-jre 
RUN apt-get update \ 
    && apt-get install -y eclipse \ 
    && apt-get install -y unzip
COPY run.sh /run.sh
VOLUME /sdks
VOLUME /output
CMD ["/run.sh"]
