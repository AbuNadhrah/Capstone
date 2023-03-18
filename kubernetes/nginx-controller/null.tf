resource "null_resource" "get_nlb_hostname" {
    provisioner "local-exec" {
        command = "aws eks --region eu-west--2 update-kubeconfig --name hr-dev-eks-demo && kubectl get svc fullnameOverridevalue-contoller.namevalue -n '${kubernetes_namespace.nginx-controller.metadata[0].name}' -o jsonpath='{status.loadBalancer.ingress[*].hostname}' > ${path.module}/lb_hostname.txt"
    }
    depends_on = [
      helm_release.ingress_nginx
    ]
}
