resource "null_resource" "get_nlb_hostname" {
    provisioner "local-exec" {
        command = "aws eks update-kubeconfig --name hr-dev-eks-demo --region eu-west-2 && kubectl get svc load-nginx  --namespace nginx-ingress -o jsonpath='{.status.loadBalancer.ingress[*].hostname}' > ${path.module}/lb_hostname.txt"
    }
    depends_on = [
      helm_release.ingress_nginx
    ]
}
