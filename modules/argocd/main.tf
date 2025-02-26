# data "aws_eks_cluster" "cluster" {
#   name = var.eks_cluster_name
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = var.eks_cluster_name
# }

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  values = [<<EOF
server:
  service:
    type: LoadBalancer
EOF
  ]
}
