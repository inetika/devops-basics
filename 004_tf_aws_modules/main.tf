module "gcp-compute" {
  source = "./modules/gcp-compute"
}

module "aws-ec2" {
  source = "./modules/aws-ec2"
}

output "gcp-ip" {
  value = module.gcp-compute.gcp-ip
}
output "aws-ip" {
  value = module.aws-ec2.aws-ip
}