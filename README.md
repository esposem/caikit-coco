# How to use

0. Download and run esposem/caikit-tgis-serving
1. set your repo in start.sh, the models will be uploaded there.
2. make sure the repos are public!
3. modify the configmap `inferenceservice-config` in namespace redhat-ods-applications and change the storageinitializer to point to `$REPO/$KS:stable` (taken from start.sh)
4. Go to caikit-tgis-serving/demo/kserve/custom-manifests/minio/minio.yaml and change the image to point to `$REPO/$MINIO:stable` (taken from start.sh)
5. run demo workload in caikit-tgis-serving/demo/kserve/scripts/test/deploy-model.sh