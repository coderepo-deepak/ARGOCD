output "argocd_server_url" {
  description = "ArgoCD Server URL"
  value       = "https://${helm_release.argocd.metadata[0].name}.elb.amazonaws.com"
}
