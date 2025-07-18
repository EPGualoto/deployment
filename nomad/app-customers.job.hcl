job "app-customers" {
  datacenters = ["dc1"]
  type        = "service"

  group "app-customers" {
    count = 1
    network {
      port "http" {

      }
    }

    task "app-customers" {
      driver = "java"

      config {
        jar_path = "C:/distribuida2025/app-customers/quarkus-run.jar"
      }

      env {
        QUARKUS_HTTP_PORT = "${NOMAD_PORT_http}"
      }

      resources {
        cpu    = 2000
        memory = 1024
      }

      service {
        provider = "nomad"
        name     = "app-customers-http"
        port     = "http"
        tags     = ["quarkus-app"]
      }
    }
  }
}
