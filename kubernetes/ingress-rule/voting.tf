resource "kubernetes_ingress_v1" "voting-ingress" {
  metadata {
    name      = "voting-app"
    namespace = "voting-app"
    labels = {
      name = "voting-service"
    }
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "cert-manager.io/cluster-issuer" = "letsencrypt-prod"
    }
  }

  spec {
    rule {
      host = "voting-app.nwokolo.live"
      http {
        path {
          backend {
            service{
              name = "voting-service"
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
        "voting-app.nwokolo.live"
      ]
      secret_name = "alt"
    }
  }
}


resource "kubernetes_ingress_v1" "result-ingress" {
  metadata {
    name      = "result-app"
    namespace = "voting-app"
    labels = {
      name = "voting-service"
    }
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "cert-manager.io/cluster-issuer" = "letsencrypt-prod"
    }
  }

  spec {
    rule {
      host = "result.nwokolo.live"
      http {
        path {
          backend {
            service{
            name = "result-service"
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
        "result.nwokolo.live"
      ]
      secret_name = "alt"
    }
  }
}
