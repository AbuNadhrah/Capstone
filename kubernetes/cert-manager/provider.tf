terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }

    kubernetes = {
        version = ">= 2.0.0"
        source = "hashicorp/kubernetes"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}


data "aws_eks_cluster" "sales-prod-eks-sales" {
  name = "sales-prod-eks-sales"
}
data "aws_eks_cluster_auth" "sales-prod-eks-sales_auth" {
  name = "sales-prod-eks-sales_auth"
}


provider "aws" {
  region     = "eu-west-1"
}
