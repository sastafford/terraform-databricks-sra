data "aws_availability_zones" "available" {
  state = "available"
}

variable "aws_account_id" {
  description = "ID of the AWS account."
  type        = string
}

variable "client_id" {
  description = "Client ID for authentication."
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Secret key for the client ID."
  type        = string
  sensitive   = true
}

variable "databricks_account_id" {
  description = "ID of the Databricks account."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Databricks only operates in AWS Gov West (us-gov-west-1)"
  default = "us-gov-west-1"
  validation {
    condition     = contains(["us-gov-west-1"], var.region)
    error_message = "Valid value for var: region is (us-gov-west-1)."
  }
}

variable "region_name" {
  description = "Name of the AWS region. (e.g. pendleton)"
  type        = map(string)
  default = {
    "civilian" = "pendleton"
    "dod" = "pendleton-dod"
  }
}

variable "resource_prefix" {
  description = "Prefix for the resource names."
  type        = string
}

// AWS Gov Only Variables
variable "account_console" {
  type = map(string)
  default = {
    "civilian" = "https://accounts.cloud.databricks.us/"
    "dod"      = "https://accounts-dod.cloud.databricks.us/"
  }
}

variable "databricks_gov_shard" {
  description = "pick shard: civilian, dod"
  validation {
    condition     = contains(["civilian", "dod"], var.databricks_gov_shard)
    error_message = "Valid values for var: databricks_gov_shard are (civilian, dod)."
  }
}

variable "databricks_prod_aws_account_id" {
  type = map(string)
  default = {
    "civilian" = "044793339203"
    "dod"      = "170661010020"
  }
}

variable "log_delivery_role_name" {
  type = map(string)
  default = {
    "civilian" = "SaasUsageDeliveryRole-prod-aws-gov-IAMRole-L4QM0RCHYQ1G"
    "dod"      = "SaasUsageDeliveryRole-prod-aws-gov-dod-IAMRole-1DMEHBYR8VC5P"
  }
}

variable "uc_master_role_id" {
  type = map(string)
  default = {
    "civilian" = "1QRFA8SGY15OJ"
    "dod"      = "1DI6DL6ZP26AS"
  }
}