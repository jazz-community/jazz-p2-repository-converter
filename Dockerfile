FROM ibmjava:8-jre 
RUN apt-get update \ 
    && apt-get install -y eclipse \ 
    && apt-get install -y unzip
COPY *.zip /sdk/
RUN unzip /sdk/*.zip -d /sdk/
RUN find / -regextype posix-extended -regex ".*org.eclipse.equinox.launcher_[0-9.v-]+.dist.jar" -exec \
    java -jar {} \
        -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
        -metadataRepository file:/output \
        -artifactRepository file:/output \
        -source /sdk \
        -publishArtifacts \
        -compress \;
