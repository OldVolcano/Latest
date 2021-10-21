###############################################################################
# Terraform main config
###############################################################################
terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.57.0"
    }
  }

}

###############################################################################
# Providers
###############################################################################
provider "aws" {
  region = var.primary_region
  allowed_account_ids = var.aws_account_id
}

provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "secondary1"
  region = var.secondary1_region
}

provider "aws" {
  alias  = "secondary2"
  region = var.secondary2_region
}


#################################################################
# Primary Cluster Provisioning
#################################################################
module "documentdb" {
  source = "./modules/documentdb"

  aws_account_id      = var.aws_account_id
  database_name       = var.database_name
  number_instances    = var.primary_instances
  kms_db_key_arn      = data.aws_kms_alias.kms_key_primary.target_key_arn
  instance_type       = var.primary_instance_class
  engine_version      = var.db_engine_version
  app_name            = var.app_name
  environment         = var.environment
  region              = var.primary_region
  cost_center         = var.cost_center
  owner_email         = var.owner_email
  data_classification = var.data_classification
  cluster_security_group = [module.security_group]
  master_password = "demo_pass123"
  master_username = "demo_user"
  name = "demo"

  create_global           = true
  global_identifier       = "global"
  global_region           = var.global_region
}
  
module "primary_cluster" {
  # Replace source with GitHub URL and reference tag
  source           = "./modules/primary-cluster"
  database_name    = var.database_name
  number_instances = var.primary_instances
  kms_db_key_arn   = data.aws_kms_alias.kms_key_primary.target_key_arn
  instance_type    = var.primary_instance_class
  engine_version   = var.db_engine_version
  global_enabled   = var.global_enabled

  #Core Info Variables
  aws_account_id      = var.aws_account_id
  app_name            = var.app_name
  environment         = var.environment
  region              = var.primary_region
  cost_center         = var.cost_center
  owner_email         = var.owner_email
  data_classification = var.data_classification

  providers = {
    aws = aws.primary
  }
}


module "secondary_cluster_1" {
  count = var.global_enabled == true && var.secondary1_enabled == true ? 1 : 0
  # Replace source with GitHub URL and reference tag
  source                    = "./modules/replica-cluster"
  global_cluster_identifier = module.primary_cluster.docdb_cluster_resource_id
  number_instances          = var.secondary1_instances
  kms_db_key_arn            = data.aws_kms_alias.kms_key_secondary1.target_key_arn
  instance_type             = var.secondary1_instance_class
  engine_version            = var.db_engine_version


  #Core Info Variables
  aws_account_id      = var.aws_account_id
  app_name            = var.app_name
  environment         = var.environment
  region              = var.secondary1_region
  cost_center         = var.cost_center
  owner_email         = var.owner_email
  data_classification = var.data_classification
  providers = {
    aws = aws.secondary1
  }

}

module "secondary_cluster_2" {
  count = var.global_enabled == true && var.secondary2_enabled == true ? 1 : 0
  # Replace source with GitHub URL and reference tag
  source                    = "./modules/replica-cluster"
  global_cluster_identifier = module.primary_cluster.docdb_cluster_resource_id
  number_instances          = var.secondary2_instances
  kms_db_key_arn            = data.aws_kms_alias.kms_key_secondary2.target_key_arn
  instance_type             = var.secondary2_instance_class
  engine_version            = var.db_engine_version

  #Core Info Variables
  aws_account_id      = var.aws_account_id
  app_name            = var.app_name
  environment         = var.environment
  region              = var.secondary2_region
  cost_center         = var.cost_center
  owner_email         = var.owner_email
  data_classification = var.data_classification

  providers = {
    aws = aws.secondary2
  }
}
