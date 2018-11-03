terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }

  terraform {
    source = "git::ssh://git@github.com/kaosmonk/tf-modules.git//terraform/modules/sql?ref=v0.11"
  }
}
  region                     = "us-west1"
  availability_type          = "REGIONAL"
  sql_instance_size          = "db-f1-micro"
  sql_disk_type              = "PD_SSD"
  sql_disk_size              = 10
  sql_require_ssl            = "false"
  sql_master_zone            = "a"
  sql_connect_retry_interval = "60"
  sql_replica_zone           = "b"
  sql_user                   = "wpuser"

