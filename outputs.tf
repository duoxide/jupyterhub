output "instances_id" {
  description = "ID of the EC2 instance"
  # value       = "${aws_instance.alex-instance.id}"
  value = "${aws_instance.alex-instance[0].id}, ${aws_instance.alex-instance[1].id}"
}

output "elb_dns" {
  description = "DNS name of Load Balancer"
  value = "${aws_lb.alex-applb.dns_name}"
}

#output "elb_id" {
#  description = "DNS name of Load Balancer"
#  value = "${module.elb.elb_id}"
#}