service {
  name = "app-customers"
  id = "app-customers"
  address = "app-customers"
  port = 8080

  check {
    name     = "app-customers-health"
    http     = "http://app-customers:8080/q/health"
    interval = "10s"
    timeout  = "3s"
  }
}
