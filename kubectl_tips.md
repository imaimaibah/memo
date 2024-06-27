# Command line proxy to access service/pod

You can enable access to the Dashboard using the kubectl command-line tool, by running the following command:

```
kubectl proxy
```

Kubectl will make Dashboard available at `http://localhost:8001/api/v1/namespaces/${NAMESPACE}/services/https:${SERVICENAME}:/proxy/`

**e.g.**
```
NAMESPACE=default
SERVICENAME=kubernetes
curl http://localhost:8001/api/v1/namespaces/${NAMESPACE}/services/https:${SERVICENAME}:/proxy/
```

```
NAMESPACE=default
POD=dashboard
curl http://localhost:8001/api/v1/namespaces/${NAMESPACE}/pods/https:${POD}:443/proxy/
```

# Update status(subresoures) with kubectl

After v1.24, you can update subresoures with kubectl.

E.g.
```
kubectl patch po mypod --type=merge --subresource=status --patch='status: {healthState: InSync}'
```

***readinessGate*** is not set automatically. You need to implement it for each pod. Here is an example.

```
kubectl patch pod --subresource=status mypod --type='json' -p='[{"op": "add", "path": "/status/conditions/-", "value": {
    "lastProbeTime": null, 
    "lastTransitionTme": "'$(date --utc +'%Y-%m-%dT%H:%M:%SZ')'", 
    "status": "True", 
    "type": "youReadinessGate"
}}]'
```

To update, you need to get the index where your readiness gate is set to.

E.g.
```
INDEX=$(kubectl get po mypod -o jsonpath={.status.conditions} | jq -r 'map(.type=="yourReadinessGate")|index(true)')
kubectl patch pod --subresource=status mypod --type='json' -p='[{"op": "replace", "path": "/status/conditions/'${INDEX}'", "value": {
    "lastProbeTime": "'$(date --utc +'%Y-%m-%dT%H:%M:%SZ')'", 
    "lastTransitionTme": "'$(date --utc +'%Y-%m-%dT%H:%M:%SZ')'", 
    "status": "True", 
    "type": "yourReadinessGate"
}}]'
```
