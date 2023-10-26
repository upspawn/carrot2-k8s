variable "CARROT2_VERSION" {
  default = "4.5.1"
}

variable "REGISTRY" {
  default = "ghcr.io/upspawn/carrot2-k8s"
}

variable "PLATFORMS" {
  default = "linux/amd64,linux/arm64"
}

group "default" {
  targets = ["carrot2"]
}

target "carrot2" {
  dockerfile = "Dockerfile"
  context    = "."
  platforms  = ["${PLATFORMS}"]
  args = {
    CARROT2_VERSION = "${CARROT2_VERSION}"
  }

  cache-from = [
    "type=registry,ref=${REGISTRY}:cache"
  ]

  cache-to = [
    "type=registry,ref=${REGISTRY}:cache,mode=max"
  ]

  tags = ["${REGISTRY}:${CARROT2_VERSION}"]
}
