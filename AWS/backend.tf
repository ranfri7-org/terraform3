terraform {
  backend "s3" {
    bucket = "rf-github-terraform7-tfstate"
    key    = "infra.tfstate3"
    region = "us-west-1"
  }
}
