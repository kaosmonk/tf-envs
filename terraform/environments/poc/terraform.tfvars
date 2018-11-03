terragrunt = {
  terraform {
    extra_arguments "retry_lock" {
      commands  = ["${get_terraform_commands_that_need_locking()}"]
      arguments = ["-lock-timeout=20m"]
    }
    extra_arguments "custom_vars" {
      commands = ["${get_terraform_commands_that_need_vars()}"]
      required_var_files = [
        "${get_parent_tfvars_dir()}/terraform.tfvars",
      ]
      optional_var_files = [
        "${get_tfvars_dir()}/../../terraform.tfvars",
        "${get_tfvars_dir()}/../terraform.tfvars",
        "terraform.tfvars",
      ]
    }
  }
  
  remote_state {
    backend = "gcs"
    config {
      bucket         = "kraken-tf-state"
      prefix         = "${path_relative_to_include()}/terraform.tfstate"
      region         = "us-west2"
      project        = "kraken-221319"
    }
  }
}

name = "kraken"
env = "poc"
region = "us-west1"
project_id = "kraken-221319"
remote_state_bucket = "kraken-tf-state"
zone = "us-west1-a"
