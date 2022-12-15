# 3-Tier HA Network Architecture - IaC
The repo will help you create a 3-tier network architecture on AWS. This repo has 5 folders out of which modules folder has all the modules. Terraform script in `base-networking-components` folder will provision VPC, subnets, route tables and NAT gateways. Scripts in `rds` folder will provision the RDS in multi-AZ mode. 

If you want to do blue-green deployment then use `blue-green-deployment-asg` folder to deploy otherwise use `autoscaling-group` folder.

### Prerequisites
- Terraform >= v1.3.0
- AWS Access Keys
### Notes
- Set your AWS keys using  `aws configure` command
- Default region is `ap-southeast-1`. You can change it in providers.tf file.
- Add your public ssh key in variable `ssh_public_key` in variables.tf file to login to the bastion server.
- Use `ssh-add -K <private-key>` command and then login to the bastion server using `ssh -i "<private-key> -A ec2-user@<bastion-public-ip>"`. Once you successfully login to the bastion, you can use `ssh ec2@<server-ip>` to login to any ec2 instance.
### Steps to deploy
- `cd base-networking-components && terraform init && terraform apply`
- `cd ../rds && terraform init && terraform apply`  (Don't forget to add you public ssh key.)
- For blue-green deployment, `cd ../blue-green-deployment-asg && terraform init && terraform apply` (Don't forget to add you public ssh key.)
- For normal deployment, `cd ../autoscaling-group && terraform init && terraform apply` (Don't forget to add you public ssh key.)
