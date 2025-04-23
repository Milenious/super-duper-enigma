// Primary region provider for deployment

provider "aws" {
    region = "us-east-1"
    alias = "primary"
}
  
// Secondary region provider for deployment
provider "aws" {
    region = "us-west-2"
    alias = "secondary"
}
