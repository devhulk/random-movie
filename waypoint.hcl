project = "example-vuejs"

app "example-vuejs" {
  build {
    use "docker" {}
    registry {
        use "docker" {
            image = "devhulk/random-movie-generator"
            tag = "latest"
        }
    }
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}