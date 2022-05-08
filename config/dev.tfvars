AwsRegion = "ca-central-1"

vpc = {
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

LoadBalancer = {

  TargetGroups = {
    techops = {
      HealthyThreshold   = 3
      UnhealthyThreshold = 10
      Timeout            = 10
      Interval           = 20
      HealthCheckPath    = "/"
      HealthCheckPort    = "80"
    }
  }
}


Ecs = {
  TaskDefinitions = {
    techops = {
      Cpu    = 1000
      Memory = 900
    }
  },
  Services = {
    techops = {
      DesiredCount       = 1
      SchedulongStrategy = "REPLICA"
    }
  }
}

EnvName = "ECS"





