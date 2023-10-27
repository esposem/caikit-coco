#! /bin/bash

set -ex

MINIO=minio
KS=kserve-storage-initializer

REPO=quay.io/eesposit

go build -o fenc -ldflags "-w -extldflags '-static'"  encr_decr.go

cp fenc $MINIO
cp fenc $KS

docker_build_and_push() {
	FOLDER=$1
	LOCAL_CONTAINER=localhost/$2
	Dockerfile=$3.Dockerfile
	IMAGE=$4

	cd $FOLDER
	docker build -t $LOCAL_CONTAINER -f $Dockerfile . --no-cache
	docker push $LOCAL_CONTAINER $REPO/$IMAGE:stable
	cd -
}

docker_build_and_push $MINIO $MINIO $MINIO $MINIO
docker_build_and_push $KS $KS $KS $KS