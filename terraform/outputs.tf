output "db_endpoint" {
  value = "${module.postgres.endpoint}"
}
output "bitbucket_endpoint" {
  value = "${module.bitbucket_instance.static_ip}:${module.bitbucket_instance.listening_port}"
}
output "jira_endpoint" {
  value = "${module.jira_instance.static_ip}:${module.jira_instance.listening_port}"
}
output "confluence_endpoint" {
  value = "${module.confluence_instance.static_ip}:${module.confluence_instance.listening_port}"
}
output "security_group_id" {
  value = "${aws_security_group.application.id}"
}
output "static_ip" {
  value = "${aws_network_interface.application.private_ip}"
}
output "listening_port" {
  value = "${var.listening_port}"
}
output "endpoint" {
  value = "${aws_db_instance.db.endpoint}"
}
