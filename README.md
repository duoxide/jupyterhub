# Blue/Green deployment provisioning using Terraform

## Description

This project is used for automated deployment of VPC, EC2, ALB in AWS using Terraform and a good example of Blue/Green way of deployment with the possibility of Canary Tests. Apache web-server is used for basic http access and demonstration purposes.

## Prequesities

* Terraform v1.3.3
* AWS account

## HOW-To deploy and use

1. `git clone`
2. `ssh-keygen`
3. `cd ./jupyterhub`
4. `aws configure`
5. `terraform init`
6. `terraform plan`
7. `terraform apply`
    * You can use either `terraform apply` and enter one of these options when prompted:
        * `blue` (100% load to blue)
        * `blue-90` (90% load to blue and 10% to green)
        * `split` (load is split 50/50 % between green and blue)
        * `green-90` (10% load to blue and 90% to green)
        * `green` (100% load to blue)
    * or you can use an option together with `terraform apply`, for example: `terraform apply -var traffic_distribution=blue`
### Ways to test
1. Using Web Browser
    * Use the output value (DNS name of ALB) and paste it to your browser http://**DNS name**
    * Press F5 and observe the change in response
2. Using Curl (Recommended)
    * `for i in seq {1..10}; do curl $(terraform output -raw elb_dns); done`

### Destroy after use

`terraform destroy`