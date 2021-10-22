include {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/eks/aws?version=17.22.0"
}

dependency "vpc" {
  config_path = "../vpc"
}


inputs = {

  cluster_version = "1.21"
  cluster_name    = "superAwesome"
  vpc_id          = dependency.vpc.outputs.vpc_id
  subnets         = dependency.vpc.outputs.public_subnets
  manage_aws_auth = false

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
      k8s_labels = {
        Environment = "exercise"
      }
    }
  }
}
