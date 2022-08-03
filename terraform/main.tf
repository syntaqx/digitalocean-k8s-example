provider "digitalocean" {
}

resource "digitalocean_kubernetes_cluster" "example" {
  name    = "k8s-example"
  region  = "sfo3"
  version = "1.23.9-do.1"
  tags    = ["example"]
  
  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}

resource "digitalocean_kubernetes_node_pool" "app_node_pool" {
  cluster_id = digitalocean_kubernetes_cluster.example.id

  name = "app-pool"
  size = "s-2vcpu-4gb" # bigger instances
  tags = ["applications"]

  # you can setup autoscaling
  auto_scale = true
  min_nodes  = 2
  max_nodes  = 5
  labels = {
    service  = "apps"
    priority = "high"
  }
}
