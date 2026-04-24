This is to use remote state file.

process to use remote state file is:
1. First create resources of s3 and dynamo DB using the folder resources_for_Backend
2. After resources are created then update the names in the backend.tf file and start writing your resources requirement.
3. Now use "terraform init" to setup remote s3 as backend state file and use Dynamo DB for locking.
4. Run commands like "terraform plan" and terraform apply" to see the state file in the s3 buckets.
5. This will be remote state file that store all the information
6. How will terraform knows if remote statefile is being used or not. For that it will create a statefile locally inside .terraform folder where it stores all the info of statefile storage place details.

Variablize the s3 bucket names and dynamo db names as well.