set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - buildpack-deps *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW Display current directory: $ANSI_RESET"
docker run -i --name some-buildpack quay.io/ibmz/buildpack-deps:bionic pwd
docker exec -i some-buildpack "apt-get update -y | grep s390x"
docker stop some-buildpack && docker rm some-build-pack
docker rmi quay.io/ibmz/buildpack-deps:bionic

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
