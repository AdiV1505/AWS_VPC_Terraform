terraform {
  backend "s3" {
    bucket         = "adi-terraform-s3-18012024"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
	}
}

