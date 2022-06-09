#
# Deploys sandbox containers to Kubernetes.
#
# Environment variables:
#
#   DOCKER_REGISTRY - The hostname of your private Docker registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/deploy-sandbox.sh
#

set -e
set -u # or set -o nounset
: "$DOCKER_REGISTRY"
: "$VERSION"

npx figit ./scripts/kubernetes/deploy-sandbox-algod.yaml --output yaml | kubectl apply -f -
npx figit ./scripts/kubernetes/deploy-sandbox-indexer.yaml --output yaml | kubectl apply -f -
