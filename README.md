Main terraform deploy for the DirICT environment.

Make sure you have defined in the .bash_profile:
- TF_VAR_password
- TF_VAR_user_name
- TF_VAR_aws_access_key
- TF_VAR_aws_secret_key

Swift Terraform setting for remote state backend set to AWS. 
Terraform.tfstate file to be found on Amazon S3.
