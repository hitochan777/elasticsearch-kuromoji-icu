#!/usr/bin/env sh

set -ex

# docker hub username
USERNAME=hitochan777
# image name
IMAGE=elasticsearch-kuromoji-icu

# bump version
version=`cat VERSION`
echo "version: $version"

docker build --build-arg es_version=$version -t $USERNAME/$IMAGE:latest .

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
