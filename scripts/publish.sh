#
# Publishs a Docker image.
#
# Environment variables:
#
#   DOCKER_REGISTRY - The hostname of your private Docker registry.
#   DOCKER_UN - User name for your Docker registry.
#   DOCKER_PW - Password for your Docker registry.
#   VERSION - The version number to tag the images with.
#
# Parameters:
#
#   1 - The name of the image.
#
# Usage:
#
#       ./scripts/publish.sh <image-name>
#

set -e
set -u # or set -o nounset
: "$1"
: "$DOCKER_REGISTRY"
: "$VERSION"
: "$DOCKER_UN"
: "$DOCKER_PW"

export NAME=$1
echo $DOCKER_PW | docker login $DOCKER_REGISTRY --username $DOCKER_UN --password-stdin
docker push $DOCKER_REGISTRY/$NAME:$VERSION