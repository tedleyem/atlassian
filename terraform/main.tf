provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

module "postgres" {
  source          = "./database"
  name_tag        = "atlassian-postgres"
  vpc_id          = "${var.vpc_id}"
  private_subnets = "${var.private_db_subnets}"
  listening_port  = "5432"

  allowed_sgs = [
    "${module.bitbucket_instance.security_group_id}",
    "${module.jira_instance.security_group_id}",
    "${module.confluence_instance.security_group_id}",
  ]

  instance_class    = "${var.db_instance_class}"
  engine            = "${var.db_engine}"
  allocated_storage = "${var.db_allocated_storage}"
  db_credentials    = ["${var.db_username}", "${var.db_password}"]
}

module "bitbucket_instance" {
  source                    = "./applications"
  name_tag                  = "atlassian-bitbucket"
  vpc_id                    = "${var.vpc_id}"
  private_subnet            = "${var.private_app_subnets[0]}"
  iam_instance_profile_name = "${aws_iam_instance_profile.ec2_instance_profile.name}"
  key_name                  = "${var.key_name}"
  instance_type             = "${var.bitbucket_instance_type}"
  home_volume_size          = "${var.bitbucket_volume_size}"
  db_endpoint               = "${module.postgres.endpoint}"
  db_credentials            = ["${var.db_username}", "${var.db_password}"]
  ansible_playbook          = "ansible/bitbucket.yml"
  proxied_url               = "${var.bitbucket_url}"
  listening_port            = "7990"
}

module "jira_instance" {
  source                    = "./applications"
  name_tag                  = "atlassian-jira"
  vpc_id                    = "${var.vpc_id}"
  private_subnet            = "${var.private_app_subnets[0]}"
  iam_instance_profile_name = "${aws_iam_instance_profile.ec2_instance_profile.name}"
  key_name                  = "${var.key_name}"
  instance_type             = "${var.jira_instance_type}"
  home_volume_size          = "${var.jira_volume_size}"
  db_endpoint               = "${module.postgres.endpoint}"
  db_credentials            = ["${var.db_username}", "${var.db_password}"]
  ansible_playbook          = "ansible/jira.yml"
  proxied_url               = "${var.jira_url}"
  listening_port            = "8080"
}

module "confluence_instance" {
  source                    = "./applications"
  name_tag                  = "atlassian-confluence"
  vpc_id                    = "${var.vpc_id}"
  private_subnet            = "${var.private_app_subnets[0]}"
  iam_instance_profile_name = "${aws_iam_instance_profile.ec2_instance_profile.name}"
  key_name                  = "${var.key_name}"
  instance_type             = "${var.confluence_instance_type}"
  home_volume_size          = "${var.confluence_volume_size}"
  db_endpoint               = "${module.postgres.endpoint}"
  db_credentials            = ["${var.db_username}", "${var.db_password}"]
  ansible_playbook          = "ansible/confluence.yml"
  proxied_url               = "${var.confluence_url}"
  listening_port            = "8090"
}
