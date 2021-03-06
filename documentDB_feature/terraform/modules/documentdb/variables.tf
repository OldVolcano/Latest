variable "group_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs."
  default     = []
}

variable "cluster_security_group" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
}

variable "master_password" {
  type        = string
  description = "Password for the master DB user."
}
/*
variable "region" {
  type        = string
  description = "Region where resources will be created."
}
*/
variable "global_identifier" {
  type        = string
  description = "The cluster identifier of the new global cluster."
}

variable "create_global" {
  type        = bool
  description = "Boolean if to create Global database or not."
}


variable "global_region" {
  type        = list(any)
  description = "List of regions where replication will be spun up."
}

variable "master_username" {
  type        = string
  description = "Username for the master DB user."
}

variable "cluster_instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "cluster_instance_count" {
  type    = number
  default = 1
}

variable "name" {
  type        = string
  description = "Unique DocumentDB cluster identifier."
}
/*
variable "backup_retention_period" {
  default = 7
  type    = number
}

variable "preferred_backup_window" {
  default = "07:00-09:00"
  type    = string
}
/*
variable "skip_final_snapshot" {
  default     = false
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  type        = bool
}
*/
variable "parameters" {
  description = "additional parameters modified in parameter group"
  type        = list(map(any))
  default     = []
}
/*
variable "apply_immediately" {
  default     = false
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
}
*/
variable "family" {
  default     = "docdb4.0"
  description = "Version of docdb family being created"
  type        = string
}

variable "engine" {
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Only `docdb` is supported."
  type        = string
}
/*
variable "engine_version" {
  default     = "4.0.0"
  description = "The database engine version. Updating this argument results in an outage."
  type        = string
}
*/
variable "aws_account_id" {}


variable "region" {
  description = "The Chewy region where the cluster will be created."
  type        = string
}

variable "environment" {
  description = "The Chewy environment this resource will be deployed in, e.g. dev, prod."
  type        = string
}

variable "app_name" {
  description = "The name of the application that this resource belongs to."
  type        = string
}

variable "cost_center" {
  description = "The Chewy cost center that this resource belongs to, e.g. IT - Supply Chain"
  type        = string
}

variable "owner_email" {
  description = "A distribution list that contains the owners of this resource. Do not specifiy an individual's email address."
  type        = string
}

variable "data_classification" {
  description = "The level of data sensitity of data on or through this resource. pci | <empty>"
  type        = string
}

variable "number_instances" {
  description = "Number of instances to create in the cluster.  At least 2 are required to ensure high-availability in-region failover capability."
  type        = number
  default     = 1
}

variable "ingress_security_groups" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "Instance type to use.  Smallest available in AWS for non-global cluster is db.t3.medium.  Smallest available in AWS for global cluster is db.r5.large."
  type        = string
  default     = "db.r5.large"
}

variable "global_enabled" {
  description = "Whether or not to provision a global, multi-region cluster versus single-region cluster"
  type        = bool
  default     = true
}

variable "database_name" {
  description = "Name for an automatically created database on cluster creation"
}

variable "username" {
  description = "Master DB username"
  type        = string
  default     = "master"
}

variable "skip_final_snapshot" {
  description = "Should a final snapshot be created on cluster destroy"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "If the DB instance should have deletion protection enabled"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "How long to keep backups for (in days)"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "When to perform DB backups"
  type        = string
  default     = "02:00-03:00"
}

variable "preferred_maintenance_window" {
  description = "When to perform DB maintenance"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = false
}

variable "db_cluster_parameter_group_name" {
  description = "The name of a DB Cluster parameter group to use"
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default = []
}

variable "snapshot_identifier" {
  description = "DB snapshot to create this database from"
  type        = string
  default     = ""
}

variable "kms_db_key_arn" {
  description = "DocumentDB KMS for database"
}

variable "engine_version" {
  description = "DocumentDB engine version."
  type        = string
  default     = "4.0.0"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "export_logs" {
  description = "Specifies whether or not database audit and profiler logs should be exported to Cloudwatch"
  type        = bool
  default     = true
}

variable "global_cluster_identifier" {
  description = "The global cluster identifier specified on aws_rds_global_cluster"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate to the cluster in addition to the SG we create in this module"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "The existing subnet group name to use"
  type        = string
  default     = ""
}

variable "ttl" {
  description = "TTL for friendly database CNAMEs"
  default     = 300
}

/*
Cluster Parameter Group
*/

variable "audit_logs" {
  default = "enabled"
}
variable "profiler" {
  default = "disabled"
}

variable "special" {
  description = " Whether or not special characters should be used when generating secrets manager value : True / False"
  default     = "false"
}
