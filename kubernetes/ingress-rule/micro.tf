resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = "sock-shop"
    namespace = "sock-shop"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
      "nginx.ingress.kubernetes.io/ssl-redirect" : "true"
      "cert-manager.io/cluster-issuer" : "letsencrypt-prod"
    }
  }

  spec {
    rule {
      host = "sock-shop.nwokolo.live"
      http {
        path {
          backend {
            service{
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
     tls {
      hosts = [
        "sock-shop.nwokolo.live"
      ]
      secret_name = "alt"
    }
  }
}
