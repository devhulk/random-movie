project = "random-movie-vue"

app "random-movie-generator" {

  build {
    use "docker" {}
    registry {
        use "docker" {
            image = "devhulk/random-movie-generator"
            tag = "latest"
        }
    }
  }

	// Deploy
	deploy {
		use "azure-container-instance" {
			subscription_id = "b8a9c85f-a94d-42ba-b859-333187793d27"
			resource_group = "random-movie-generator"
				location       = "eastus"
				ports          = [80]

				capacity {
					memory = "1024"
						cpu_count = 4
				}

			volume {
				name = "vol1"
					path = "/random-movie-generator"
					read_only = true

					git_repo {
						repository = "https://github.com/devhulk/random-movie"
					}
			}
		}
	}

}
