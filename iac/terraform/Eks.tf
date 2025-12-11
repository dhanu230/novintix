module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true


  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  authentication_mode = "API_AND_CONFIG_MAP"

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      instance_types = ["t3.small"]

      iam_role_additional_policies = {
        ecr_pull_access       = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        cloudwatch_logs       = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
        cloudwatch_full       = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
        secretsmanager_access = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
        amp_access            = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
      }
    }
  }
}
