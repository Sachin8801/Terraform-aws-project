terraform {
  backend "s3" {
    bucket         = "project-tf-state-bucket-941377127190-ap-south-1-an"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = "true"
  }
}