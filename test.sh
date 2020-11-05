set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - buildpack-deps *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW access to ubuntu-bionic package repositories? (this image is used as a base for building light-weight ubuntu environments): $ANSI_RESET"
docker run -i --rm --name some-buildpack quay.io/ibmz/buildpack-deps:bullseye-scm apt-get update -y | grep s390x
docker rmi quay.io/ibmz/buildpack-deps:bullseye-scm

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
