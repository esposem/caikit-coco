#! /bin/bash

set -ex

MINIO=${MINIO:-"minio"}
KS=${KS:-"kserve-storage-initializer"}
TAG=${TAG:-"no-ssl"}

REPO=${REPO:-"quay.io/eesposit"}

go build -o fenc -ldflags "-w -extldflags '-static'"  encr_decr.go

cp fenc $MINIO
cp fenc $KS

docker_build_and_push() {
	NAME=$1
	FOLDER=$NAME
	Dockerfile=$NAME.Dockerfile
	IMAGE=$NAME

	cd $FOLDER
	docker build -t $REPO/$IMAGE:$TAG -f $Dockerfile . --no-cache
	docker push $REPO/$IMAGE:$TAG
	cd -
}

# docker_build_and_push $MINIO
docker_build_and_push $KS