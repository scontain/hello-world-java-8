#!/bin/bash
set -e
source sgx_device.sh

determine_sgx_device &&\
echo "Run sconified image..." && \
docker run -it --rm --network=host $MOUNT_SGXDEVICE \
-eSCONE_VERSION=1 \
-eSCONE_HEAP=4G \
-eSCONE_MODE=hw \
-eSCONE_LOG="DEBUG" \
-ePATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin" \
-eLANG="C.UTF-8" \
-eJAVA_TOOL_OPTIONS="-Xmx256m" \
-eLD_LIBRARY_PATH="/usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server:/usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64:/usr/lib/jvm/java-1.8-openjdk/jre/../lib/amd64:/" \
-eJAVA_HOME="/usr/lib/jvm/java-1.8-openjdk" \
hello-world-java-8-scone java -jar /app/app.jar
