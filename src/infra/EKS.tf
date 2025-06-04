module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "example"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true

  vpc_id     = "vpc-1234556abcdef"
  subnet_ids = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type          = "AL2_x86_64"
    disk_size       = 50
    instance_type    = ["m6i.large", "m5.large", "m5n.large"]
    vpc_security_group_ids = [aws_security_group.additional.id]
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size        = 1
      max_size        = 10
      desired_size    = 1
      
      instance_type  = ["t3.large"]
      capacity_type = "SPOT"
      labels = {
        Enviroment = "test"
        GithubRepo = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
      taints = {
          dedicated = {
            key   = "dedicated"
            value = "gpuGroup"
            effect = "NO_SCHEDULE"
          }
      }
      tags = {
        ExtraTag = "example"
      } 
    }
  }
}