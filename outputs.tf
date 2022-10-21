output "instances_id" {
  description = "ID of the EC2 instance"
  value       = "${aws_instance.alex-instance.id}"
}

output "elb_dns" {
  description = "DNS name of Load Balancer"
  value = "${module.elb.elb_dns_name}"
}

output "elb_id" {
  description = "DNS name of Load Balancer"
  value = "${module.elb.elb_id}"
}