resource "kubernetes_deployment" "Django-API" {
  metadata {
    name = "django-api"
    labels = {
      test = "django"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "django"
      }
    }

    template {
      metadata {
        labels = {
          test = "django"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "django"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/clientes/"
              port = 8000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "loadbalancer-django-api"
  }
  spec {
    selector = {
      nome = "django"
    }
    port {
      port        = 8080
      target_port = 8000
    }
    type = "LoadBalancer"
  }
}