# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "http" {
    address        = "https://gitlab.com/api/v4/projects/39364777/terraform/state/cluster"
    lock_address   = "https://gitlab.com/api/v4/projects/39364777/terraform/state/cluster/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/39364777/terraform/state/cluster/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = "5"
  }
}
