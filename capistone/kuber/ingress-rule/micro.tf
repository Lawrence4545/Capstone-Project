resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = "capstone-sock-shop"
    namespace = "capstone-sock-shop"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "capstone-sock-shop.thelawrence.xyz"
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
  }
}
