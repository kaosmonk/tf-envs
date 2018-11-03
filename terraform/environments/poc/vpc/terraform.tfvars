terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }

  terraform {
    source = "git::ssh://git@github.com/kaosmonk/tf-modules.git//terraform/modules/vpc?ref=v0.9"
  }
}

subnet_cidr = "10.88.0.0/24"
