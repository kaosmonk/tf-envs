terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }

  terraform {
    source = "git::ssh://git@github.com/kaosmonk/tf-modules.git//terraform/modules/gcp?ref=v0.1"
  }
}

project_id = "kraken-221319"
region = "us-west2"
