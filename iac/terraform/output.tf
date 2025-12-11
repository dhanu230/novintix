output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "jenkins_public_ip" {
  value = module.ec2_instance.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.demo_repo.repository_url
}
