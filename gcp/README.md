### GCP steps

Step 1 - create sa and download key

[Run the follow to get gcp service account key](https://devtoolhub.com/2024/01/creating-a-gcp-service-account-and-key-step-by-step-guide/#:~:text=Creating%20a%20GCP%20Service%20Account%20and%20Key%3A%20Step-by-Step,Fill%20in%20Service%20Account%20Details%3A%20...%20More%20items)


Generate and download key (gcloud) 
```
gcloud iam service-accounts keys create KEY_FILE \
--iam-account=SA_NAME@PROJECT_ID.iam.gserviceaccount.com
```


---
### Terraform steps

Step 2 - create a tfvars file 
create a dev.auto.tfvars file if you want to overwrite default variables

gke_cluster_name = "showcase_cluster"

Step 3 - Create cloud storage bucket to storage terraform state

```
terraform init
terraform plan
terraform apply or terraform apply -auto-approve

terraform init -migrate-state
```

Step 4 - destroy resource (optional)

```
terraform destroy
```

---
### Kubernetes steps

Step 5 - get kubernetes credentials 

For zonal cluster
```
gcloud config set project <project-id>
gcloud container clusters get-credentials <cluster-name> --zone <zone>
```

or 

For reginal cluster
```
gcloud container clusters get-credentials <cluster-name> --region <region>
```

*Note - A .key file should be generated at the root of the project*

Step 6 - deploy  deployment.yaml

```
kubectl apply -f $HOME/cloud/gcp/k8s/simple/deployment.yaml
```

confirm deployment
```
kubectl get pods
```

Step 7 - deploy service.yaml

Create a service for the Apache application and watch the public in the EXTERNAL-IP Column to host the application now that it is not inside the Kubernetes Cluster.

```
kubectl apply -f $HOME/cloud/gcp/k8s/simple/svc.yaml
```
confirm service and get external ip address
```
kubectl get services 
```


*Remove deployment and service (optional)*

```
kubectl delete services <service-name>
```

```
kubectl get deploy -A
```

```
kubectl delete deploy <deployment-name> -n namespacename
```

Step 7a - deploy ingress 

deploy services
```
kubectl apply -f $HOME/cloud/gcp/k8s/ingress/echo-v1-ingress.yaml
kubectl apply -f $HOME/cloud/gcp/k8s/ingress/echo-v2-ingress.yaml
```

get all services
```
kubectl get services -A
```


```
kubectl apply -f $HOME/cloud/gcp/k8s/ingress/multiple-host-names.yaml
```

get ingress within all namespaces
```
kubectl get ingress -A
```

Add entry to match host on ingress
Windows edit 
C:\Windows\system32\drivers\etc
host file (in example below 'echo.robofarming.link' is the host)

```
34.120.22.165 echo.robofarming.link 
```


---
### Cleanup (Terraform)

Step 8 - destroy resource (optional)

```
terraform destroy
```