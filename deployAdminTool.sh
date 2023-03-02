#!/bin/bash


BASEDIR=${0%/*}

if [[ ${0} == ${BASEDIR} ]];then
  BASEDIR="."
fi

NODE=$1

if [ -z ${NODE} ];then
  echo "NODE isn't specified"
  exit 1
fi

NUM=$(awk '/^__YAML__/ {print NR}' $0)

sed -n "$((NUM+1)),\$p" $0 | sed 's#__NODE_NAME__#'${NODE}'#' | kubectl apply -f -
exit 0

__YAML__
apiVersion: v1
kind: Pod
metadata:
  namespace: default
  name: admin-tool
  labels:
    apps: admin-tool
spec:
  containers:
    - image: busybox
      name: admin-tool
      command:
        - sleep
        - 365d
      securityContext:
        privileged: true
  hostPID: true
  nodeName: __NODE_NAME__
