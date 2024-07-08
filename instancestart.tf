#get all instance
# data "aws_instances" "runningstate" {
  
#   filter {
#     name = "vpc-id"
#     values = ["vpc-0220b64c348f18b5e"]
#   }
#   instance_state_names = ["running"]
# }

#get all stopped instance

# resource "aws_ec2_instance_state" "runningstate" {
#    instance_id = data.aws_instances.runningstate.id
#    state = "stopped"
# }