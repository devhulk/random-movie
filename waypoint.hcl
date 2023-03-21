project = "example-vuejs"

app "example-vuejs" {
  build {
    use "docker" {}
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}