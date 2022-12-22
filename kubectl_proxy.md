# Command line proxy
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

