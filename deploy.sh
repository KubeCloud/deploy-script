#!/bin/bash
for i in "$@"
do
case $i in
    -v=*|--version=*)
    VERSION="${i#*=}"
    ;;
    -r=*|--repo=*)
    REPO="${i#*=}"
    ;;
    -j=*|--jar=*)
    JAR="${i#*=}"
    ;;

     *)
            # unknown option
    ;;
esac
done

echo
echo "hub.docker.com repository to push to:" ${REPO}
echo "version to tag the container with besides:"  ${VERSION}

echo 'FROM hypriot/rpi-java
COPY '$JAR' /data/
EXPOSE 8080
CMD ["java", "-jar", "'$JAR'"]' > Dockerfile

echo
echo "Containerizing the successful build"
echo "######### STEP 1 - BUILDING DOCKER CONTAINER #########"
docker build -t ${REPO}:${VERSION} .  
docker tag -f ${REPO}:${VERSION} ${REPO}:latest

echo
echo "######### STEP 2 - PUSHING CONTAINER TO HUB.DOCKER.COM #########"
docker push ${REPO}:${VERSION}
docker push ${REPO}:latest

rm Dockerfile

echo
echo "######### ALL DONE! #########"