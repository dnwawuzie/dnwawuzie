
module "vpc" {
  source   = "./modules/vpc"
  settings = var.vpc
}


module "security_group" {
  source  = "./modules/security_group"
  EnvName = var.EnvName
  VpcId   = module.vpc.vpc_id
}

module "ecs-role" {
  source  = "./modules/ecs_role"
  EnvName = var.EnvName
}

module "ECSCluster" {
  source  = "./modules/ecs_cluster"
  EnvName = var.EnvName
}


module "TaskDefinitiontechops" {
  source              = "./modules/task_definition"
  EnvName             = var.EnvName
  Name                = "techops"
  TaskDefRole         = module.ecs-role.TaskDefRoleArn
  Settings            = var.Ecs.TaskDefinitions.techops
}


module "Servicetechops" {
  source                = "./modules/service"
  EnvName               = var.EnvName
  Name                  = "techops"
  TaskDefRole           = module.ecs-role.TaskDefRoleArn
  Settings              = var.Ecs
  ECSClusterName        = module.ECSCluster.ECSClusterName
  TaskDefinition        = module.TaskDefinitiontechops.TaskDefinitiontechops[0]
  TargetGroupArntechops = module.alb.TargetGroupArntechops
  subnet_id = module.vpc.public_subnets
  security_group_id = module.security_group.InstanceSecurityGroupId
}

# autoscaling module #
module "autoscaling_group_techops" {
  source                  = "./modules/autoscaling_group"
resource_id = "service/${module.ECSCluster.ECSClusterName}/${module.Servicetechops.servicename}"
}


module "alb" {
  source                      = "./modules/alb"
  EnvName                     = var.EnvName
  Settings                    = var.LoadBalancer
  PublicSubnetId              = module.vpc.public_subnets
  VpcId                       = module.vpc.vpc_id
  LoadBalancerSecurityGroupId = module.security_group.LoadBalancerSecurityGroupId
  AutoScalingGrouptechops     = module.autoscaling_group_techops.AutoScalingGrouptechopsName
}

