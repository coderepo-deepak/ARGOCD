terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "my-ds-test"
    key            = "backend/argocd.tfstate"
    region         = "us-west-2"
    #dynamodb_table = "terraform-eks-state-locks"
    #encrypt        = true
  }
}

module "argocd" {
  source            = "../modules/argocd"
  eks_cluster_name  = var.eks_cluster_name
  argocd_namespace  = var.argocd_namespace
}
