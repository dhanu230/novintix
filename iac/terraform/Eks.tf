module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "demo-eks"
  cluster_version = "1.29"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  control_plane_subnet_ids       = module.vpc.private_subnets
  create_iam_role                = true

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  authentication_mode = "API_AND_CONFIG_MAP"

  enable_irsa = true

  access_entries = {
  admin_user = {
    principal_arn = "arn:aws:iam::037776138029:user/dhanu"

    policy_associations = {
      cluster_admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}

  
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
