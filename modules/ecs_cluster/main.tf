resource "aws_ecs_cluster" "ECSCluster" {
  name = "${terraform.workspace}-${var.EnvName}-Cluster"
}
