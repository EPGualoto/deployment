job "app-books" {
  datacenters = ["dc1"]
  type        = "service"

  group "app-books" {
    count = 1

    network {
      port "http" {}
    }

    task "app-books" {
      driver = "exec"

      config {
        command = "java"
        args    = ["-jar", "C:/distribuida2025/app-books/quarkus-run.jar"]
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
        name     = "app-books-http"
        port     = "http"
        tags     = ["quarkus-app"]
      }
    }
  }
}
