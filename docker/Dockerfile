FROM ibmjava:8-jre 
RUN apt-get update \ 
    && apt-get install -y eclipse \ 
    && apt-get install -y unzip
COPY run.sh /run.sh
# this will be the input directory
VOLUME /sdks
# this is where the sdks should be created
VOLUME /output
CMD ["/run.sh"]
