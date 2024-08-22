# Terraform managed Atlassian stack in AWS

### Required automation tools
- Terraform `1.9.5`


## SETUP for M1 Mac
```
$ brew install tfenv
$ tfenv list_remote
$ tfenv install

# For amd64 architecture
$ TFENV_ARCH=amd64 tfenv install 1.1.9
$ ​​tfenv use 1.9.5 #switch default to installed version
```

## Deploy
Install
```
$ terraform init
```

Plan (with defaults)
```
$ terraform plan
```

Plan (with env vars)
```
$ terraform plan -var-file="variables-dev.tfvars"
```

Apply
```
$ terraform apply
```

## Things to Note
* This project installs each Atlassian app in a private network that points to a public Gateway.
* This project also provisions a different ec2 (in an isolated ASG for [self-healing](https://aws.amazon.com/blogs/apn/building-self-healing-infrastructure-as-code-with-dynatrace-aws-lambda-and-aws-service-catalog/)) for each app along with an RDS DB that all the apps point to.
* This project has an Ansible playbook for installing each application which are bootstrapped via cloud-init scripts.

## AWS Requirements
- Non-default VPC with at least 2 private subnets
- SSH key(s) uploaded to AWS
- Reverse proxy configured in a public subnet
- Set of registered domain names for each of the applications


## Terraform Outputs provided

| Name | Description |
|------|-------------|
| db_endpoint | Database endpoint |
| bitbucket_endpoint | Bitbucket static endpoint |
| jira_endpoint | Jira static endpoint |
| confluence_endpoint | Confluence static endpoint |

## Terraform Inputs Used
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_region | AWS region to use | string | us-east-1 | yes |
| profile | AWS profile used for deployment | string | default | no |
| key_name | Name of the public key to install on EC2 instances | string | | yes |
| vpc_id | VPC ID to launch instances in | string |  | yes |
| private_app_subnets | Private subnet ID(s) for application deployments | list |  | yes |
| private_db_subnets | Private subnet IDs for DB instance. At least 2 is required to make DB subnet group | list |  | yes |
| bitbucket_instance_type | EC2 instance type | string | t2.medium | yes |
| bitbucket_volume_size | Attached EBS volume size | number | 10 | yes |
| bitbucket_url | URL that will be passed down to conifgure Tomcat | string |  | yes |
| jira_instance_type | EC2 instance type | string | t2.small | yes |
| jira_volume_size | Attached EBS volume size | number | 10 | yes |
| jira_url | URL that will be passed down to conifgure Tomcat | string |  | yes |
| confluence_instance_type | EC2 instance type | string | t2.medium | yes |
| confluence_volume_size | Attached EBS volume size | number | 10 | yes |
| confluence_url | URL that will be passed down to conifgure Tomcat | string |  | yes |
| db_instance_class | RDS instance type | string | db.t2.micro | yes |
| db_engine | DB engine to use | string | postgres | yes |
| db_allocated_storage | Amount of storage to allocate | number | 10 | yes |
| db_username | DB username | string |  | yes |
| db_password | DB password | string |  | yes |