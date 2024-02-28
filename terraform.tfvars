# For Resource Group Module
rg_name = "MK_RG"

# Commonly used for all modules
location = "westeurope"
default_tags = {
  environment = "poc"
  deployed_by = "terraform"
}

# For Vnet
vnet_name     = "MK_vnet"
address_space = "10.31.0.0/16"

# For Subnet Module
subnet_name_fe = "MKFESubnet"
subnet_fe      = "10.31.0.0/24"
subnet_name_be = "MKBESubnet"
subnet_be      = "10.31.1.0/24"

# For Public IP creation
fepip_name          = "mkfepip"
bepip_name          = "mkbepip"
allocation_method   = "Static"

# For NSG
nsg_name = "mk_nsg"

# Security rule variable used in NSG
sr_name                   = "rdp"
sr_priority               = "2000"
sr_direction              = "Inbound"
sr_access                 = "Allow"
sr_protocol               = "Tcp"
sr_destination_port_range = "3389"

# For Webapp
appservice_name = "MKappsp"

# for Routetbable
mkrt = "mkrt"

# for mssql

# For Mssql
storage_size_in_gb = "32"
vcores             = "8"
license_type       = "BasePrice"
sku_name           = "GP_Gen5"
