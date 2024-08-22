# Atlassian Suite Deployments
This repository is a container for deploying
Atlassian Bitbucket,Confluence, and Jira on multiple
platforms.

### Deployment Strategies
- [Docker](docker/README.md)
- [Kubernetes](kubernetes/README.md)
- [Terraform](terraform/README.md)
- [Ansible](ansible/README.md)

### Deployed Atlassian Products:
- Jira `7.9.2`
- Confluence `6.9.0`
- Bitbucket `5.10.1`

With:
- Postgres `9.4`
- Nginx `latest`


### Required automation tools
- Terraform `1.9.5` # TFENV_ARCH=amd64 tfenv install 1.1.9


## Terraform Outputs

| Name | Description |
|------|-------------|
| db_endpoint | Database endpoint |
| bitbucket_endpoint | Bitbucket static endpoint |
| jira_endpoint | Jira static endpoint |
| confluence_endpoint | Confluence static endpoint |