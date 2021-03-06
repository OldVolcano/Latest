#data_classification###############################################################################
# Variables - Environment
###############################################################################

variable "region" {
  description = "Region where resources will be created."
  type        = string
  default     = "us-east-1"
}

#####
# Core Info Variables
#####
variable "primary_region" {
  description = "Primary region"
  default     = "us-east-1"
  type        = string
}

variable "secondary1_region" {
  description = "Secondary region 1"
  default     = "us-east-2"
  type        = string
}

variable "secondary2_region" {
  description = "Secondary region 2"
  default     = "us-west-2"
  type        = string
}

variable "environment" {
  description = "The Chewy environment this resource will be deployed in, e.g. dev, prod."
  type        = list(string)
  default = ["dev"]
}

variable "app_name" {
  description = "The name of the application that this resource belongs to."
  type        = string
  default = "DocumentDB"
}

variable "cost_center" {
  description = "The Chewy cost center that this resource belongs to, e.g. IT - Supply Chain"
  type        = string
  default = "Platform_Engineer"
}

variable "owner_email" {
  description = "A distribution list that contains the owners of this resource. Do not specifiy an individual's email address."
  type        = string
}

variable "data_classification" {
  description = "The level of data sensitity of data on or through this resource. pci | <empty>"
  type        = string
}

variable "kms_key_prefix" {
  description = "The prefix of the hyphen-separated KMS key name for database encryption, e.g. <prefix>-db-key"
  type        = string
  default = "DocumentDB"
}

variable "primary_instance_class" {
  description = "Instance type to be used"
}

variable "secondary1_instance_class" {
  description = "Instance type to be used for secondary cluster 1"
}

variable "secondary2_instance_class" {
  description = "Instance type to be used for secondary cluster 2"
}

variable "db_engine_version" {
  description = "Version of DocumentDB engine"
  default     = "4.0.0"
  type        = string
}

variable "primary_instances" {
  description = "Number of primary instances, including writer node"
  default     = 2
  type        = number
}

variable "secondary1_instances" {
  description = "Number of instances for replica cluster 1"
  default     = 2
  type        = number
}

variable "secondary2_instances" {
  description = "Number of instances for replica cluster 2"
  default     = 2
  type        = number
}

variable "database_name" {
  description = "Name of database to create"
  type        = string
  default = "DocumentDB_Demo"
}

variable "global_enabled" {
  description = "Whether or not to enable and create a global, multi-region cluster versus single-region cluster."
  type        = bool
  default     = true
}

variable "secondary1_enabled" {
  description = "Whether or not to provision secondary cluster 1"
  type        = bool
  default     = false
}

variable "secondary2_enabled" {
  description = "Whether or not to provision secondary cluster 2"
  type        = bool
  default     = false
}

variable "secondary1" {}

variable "secondary2" {}

variable "aws_account_id" {
  type        = list(string)
  description = "A list of account IDs."
  default     = ["243249644484"]
}

variable "global_region" {
type = list(string)
default = ["us-east-2","us-west-1"]
}
