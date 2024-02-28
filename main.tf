provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source      = "./modules/resourcegroup"
  rg_name     = var.rg_name
  rg_location = var.location
  rg_tag      = var.default_tags
}

module "vnet" {
  source        = "./modules/vnet"
  rg_name       = module.resourcegroup.rg_name
  vnet_location = var.location
  tags          = var.default_tags
  vnet_name     = var.vnet_name
  address_space = var.address_space
}

module "subnet" {
  source         = "./modules/subnet"
  rg_name        = module.resourcegroup.rg_name
  vnet_name      = module.vnet.vnet_name
  subnet_fe      = [var.subnet_fe]
  subnet_name_fe = var.subnet_name_fe
  subnet_be      = [var.subnet_be]
  subnet_name_be = var.subnet_name_be
  nsgid          = module.NetworkSecurityGroup.nsg_id
}

module "routetable" {
  source         = "./modules/routetable"
  rg_name        = module.resourcegroup.rg_name
  location       = var.location
  mkrt           = var.mkrt
  subnetid       = module.subnet.subnet_idbe

}

module "PublicIP" {
  source            = "./modules/PublicIP"
  fepip_name          = var.fepip_name
  bepip_name          = var.bepip_name
  pip_location        = var.location
  rg_name             = module.resourcegroup.rg_name
  allocation_method   = var.allocation_method
}

module "appicationgateway" {
  source                         = "./modules/applicationgateway"
  rg_name                        = module.resourcegroup.rg_name
  location                       = var.location
  gwipConfig_subnetid            = module.subnet.subnet_idfe
  feipConfig_pipid               = module.PublicIP.fepip_id
 }

module "NetworkSecurityGroup" {
  source                    = "./modules/NSG"
  nsg_name                  = var.nsg_name
  rg_name                   = module.resourcegroup.rg_name
  nsg_location              = var.location
  sr_name                   = var.sr_name
  sr_priority               = var.sr_priority
  sr_direction              = var.sr_direction
  sr_access                 = var.sr_access
  sr_protocol               = var.sr_protocol
  sr_destination_port_range = var.sr_destination_port_range

}

module "webapp" {
  source          = "./modules/Webapp"
  appservice_name = var.appservice_name
  location        = var.location
  rg_name         = module.resourcegroup.rg_name
}


module "mssql" {
  source           = "./modules/Mssql"
  rg_name          = module.resourcegroup.rg_name
  location         = var.location
  subnetid         = module.subnet.subnet_idbe
  sku_name         = var.sku_name
  license_type     = var.license_type
  vcores           = var.vcores
  storage_size_in_gb = var.storage_size_in_gb

}
