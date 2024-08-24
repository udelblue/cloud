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

```
gcloud container clusters get-credentials <cluster-name>
```