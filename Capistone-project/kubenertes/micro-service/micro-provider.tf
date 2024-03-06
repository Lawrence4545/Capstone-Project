terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

data "aws_eks_cluster" "law-dev-eks" {
  name = "law-dev-eks"
}
data "aws_eks_cluster_auth" "law-dev-eks_auth" {
  name = "law-dev-eks_auth"
}
provider "kubernetes" {
  host                   = data.aws_eks_cluster.law-dev-eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.law-dev-eks.certificate_authority[0].data)
  version          = "2.16.1"
  config_path = "~/.kube/config"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "law-dev-eks"]
    command     = "aws"
  }
}

resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = "sock-shop"
  }
}