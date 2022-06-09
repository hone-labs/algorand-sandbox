#
# Builds a Docker image.
#
# Environment variables:
#
#   DOCKER_REGISTRY - The hostname of your private Docker registry.
#   VERSION - The version number to tag the images with.
#
# Parameters:
#
#   1 - The path to the code for the image.
#   2 - The name of the image.
#
# Usage:
#
#       ./scripts/build.sh <directory> <image-name>
#

set -e
set -u # or set -o nounset
: "$1"
: "$DOCKER_REGISTRY"
: "$VERSION"

export DIR=$1
export NAME=$2
docker build -t $DOCKER_REGISTRY/$NAME:$VERSION --file ./$DIR/Dockerfile .
