terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }

  terraform {
    source = "git::ssh://git@github.com/kaosmonk/tf-modules.git//terraform/modules/gke?ref=v0.8"
  }
}

node_count = 1
max_node_count = 2
min_node_count = 1
machine_type = "n1-standard-2"
disk_size_gb = "30"
image_type = "COS"
additional_zones = [
  "us-west1-b",
  "us-west1-c"
  ]
resource_labels = {
  environment = "poc"
  cluster       = "kraken-poc-resource_label"
  terraform   = "true"
}
