variable "rg_name" {
  description = "Name of Resource Group name"
  default     = ""
}

variable "location" {
  description = "Name of Resource Group location"
  default     = ""
}

variable "default_tags" {
  description = ""
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = ""
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet_fe" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "subnet_name_fe" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "subnet_be" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "subnet_name_be" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "nsgid" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

#PIP

variable "fepip_name" {
  description = ""
  default     = ""
}

variable "bepip_name" {
  description = ""
  default     = ""
}

variable "pip_location" {
  description = ""
  default     = ""
}

variable "allocation_method" {
  description = ""
  default     = ""
}

variable "gwipConfig_subnetid" {
    default = ""
}

variable "feipConfig_pipid" {
    default = ""
}

# Variables used for NSG Module

variable "nsg_name" {
  description = "Name of the Resource Group"
  default     = ""
}


# For Security rule in NSG

variable "sr_name" {
  description = "Name of the security rule in NSG"
  default     = ""
}

variable "sr_priority" {
  description = "Priority of the security rule in NSG"
  default     = ""
}

variable "sr_direction" {
  description = "Direction of the security rule in NSG"
  default     = ""
}

variable "sr_access" {
  description = "Access of the security rule in NSG"
  default     = ""
}

variable "sr_protocol" {
  description = "Protocol of the security rule in NSG"
  default     = ""
}

variable "sr_destination_port_range" {
  description = "Destination port range of the security rule in NSG"
  default     = ""
}

# App serivce

variable "appservice_name" {
  description = "Name of the App service Plan"
  default     = ""
}

# for routetable

variable "mkrt" {
  description = "name of route table"
  type        = string
  default     = ""
}

# for mssql

variable "sku_name" {
  type        = string
  description = "Enter SKU"
}

variable "license_type" {
  type        = string
  description = "Enter license type"
}

variable "vcores" {
  type        = number
  description = "Enter number of vCores you want to deploy"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Enter storage size in GB"
}


