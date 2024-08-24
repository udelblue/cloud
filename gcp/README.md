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
terraform apply 
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
kubectl apply -f cloud/gcp/k8s/deployment.yaml
```

confirm deployment
```
kubectl get pods
```

Step 7 - deploy service.yaml

Create a service for the Apache application and watch the public in the EXTERNAL-IP Column to host the application now that it is not inside the Kubernetes Cluster.

```
kubectl apply -f cloud/gcp/k8s/svc.yaml
```
confirm service
```
kubectl get services
```