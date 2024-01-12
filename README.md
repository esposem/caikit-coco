# How to use

0. Download and run esposem/caikit-tgis-serving
1. set your repo in start.sh, the models will be uploaded there.
2. ./start.sh
3. make sure the repos are public!
4. modify the configmap `inferenceservice-config` in namespace redhat-ods-applications and change the storageinitializer to point to `$REPO/$KS:$TAG` (taken from start.sh)
5. Go to caikit-tgis-serving/demo/kserve/custom-manifests/minio/minio.yaml and change the image to point to `$REPO/$MINIO:$TAG` (taken from start.sh)
6. run demo workload in caikit-tgis-serving/demo/kserve/scripts/test/deploy-model.sh