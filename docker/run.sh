#!/bin/bash

# this should always find exactly one jar
equinoxLauncher=$(find / -regextype posix-extended -regex ".*org.eclipse.equinox.launcher_[0-9.v-]+.dist.jar" 2> /dev/null)

mkdir /output

for zip in /sdks/*.zip; do
    base=${zip##*/}
    fname=${base%.*}
    
    unzip $zip -d /sdks/$fname

    java -jar $equinoxLauncher \
        -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
        -metadataRepository file:/output/$fname/ \
        -artifactRepository file:/output/$fname/ \
        -source /sdks/$fname \
        -publishArtifacts \
        -compress \;
done
