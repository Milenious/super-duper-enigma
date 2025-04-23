terraform {
    backend "s3" {
        bucket = "lk_super_bucket"
        key    = "global/super-duper-enigma/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        encrypt = true
      
    }
}