# Terraform EKS ArgoCD Module

## Overview
This Terraform module deploys ArgoCD on an existing EKS cluster.

## Prerequisites
- Terraform installed (`>=1.0.0`)
- AWS CLI configured
- An existing EKS cluster

## Usage
```hcl
module "eks_argocd" {
  source           = "./modules/argocd"
  eks_cluster_name = "my-eks-cluster"
  argocd_namespace = "argocd"
}
```

## Deployment
```sh
terraform init
terraform plan
terraform apply -auto-approve
```

## Access ArgoCD
Get the ArgoCD admin password:
```sh
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
