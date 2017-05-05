#!/bin/bash

# improved parameter handling would be nice, but good enough for now.
if [ $# -ne 3 ]; then
    echo "Usage: converter /path/to/equinox/launcher /path/to/destination /path/to/sdk"
    echo "Remember to use absolute paths"
    exit -1
fi

java -jar $1 \
    -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
    -metadataRepository file:$2 \
    -artifactRepository file:$2 \
    -source $3 \
    -publishArtifacts \
    -compress
