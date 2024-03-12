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


data "aws_eks_cluster" "eks" {
  name = "eks"
}
data "aws_eks_cluster_auth" "eks_auth" {
  name = "eks_auth"
}


provider "aws" {
  region     = "us-west-1"
}

provider "helm" {
    kubernetes {
       #host                   = data.aws_eks_cluster.hr-dev-eks-demo.endpoint
      # cluster_ca_certificate = base64decode(data.aws_eks_cluster.law-dev-eks.certificate_authority[0].data)
       #token                  = data.aws_eks_cluster_auth.law-dev-eks_auth.token
       config_path = "~/.kube/config"
    }
}

provider "kubernetes" {
  #host                   = data.aws_eks_cluster.law-dev-eks.endpoint
 # cluster_ca_certificate = base64decode(data.aws_eks_cluster.law-dev-eks.certificate_authority[0].data)
  #token                  = data.aws_eks_cluster_auth.law-dev-eks_auth.token
 #  version          = "2.16.1"
  config_path = "~/.kube/config"
}

provider "kubectl" {
   load_config_file = false
   host                   = data.aws_eks_cluster.eks.endpoint
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
   token                  = data.aws_eks_cluster_auth.eks_auth.token
   config_path = "~/.kube/config"
}


#export the kubeconfig file

#export KUBECONFIG=~/.kube/config