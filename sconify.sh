#!/bin/bash

docker run -it --rm \
            -v /var/run/docker.sock:/var/run/docker.sock \
            registry.scontain.com:5050/sconecuratedimages/iexec-sconify-image:5.3.1 sconify_iexec \
            --name=helloWorldJava \
            --from=registry.scontain.com:5050/sconecuratedimages/iexecsgx:hello-world-java-8 \
            --to=hello-world-java-8-scone \
            --binary-fs \
            --fs-dir=/app \
            --binary="/usr/lib/jvm/java-1.8-openjdk/jre/bin/java" \
            --heap="4G" \
            --dlopen="2" \
            --no-color \
            --verbose \
            --command="java -jar /app/app.jar"
