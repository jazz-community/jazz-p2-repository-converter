FROM ibmjava:8-jre 
RUN apt-get update \ 
    && apt-get install -y eclipse \ 
    && apt-get install -y p7zip-full
COPY *.zip /tmp
RUN unzip /tmp/*.zip -d /sdk
RUN echo "hello world"
