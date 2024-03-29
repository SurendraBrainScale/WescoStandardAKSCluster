cluster_name                = "aks-wesco-standard-dev"
resource_group              = "rg-wesco-standard-dev"
location                    = "eastus"
dns_prefix                  = "aks-wesco-standard-dev"
node_count                  = 2
vm_size                     = "Standard_DS2_v2"
os_type                     = "Linux"
os_disk_size_gb             = 100
max_pods                    = 110
address_space               = "10.1.0.0/16"
subnet_name                 = "snet-aksstandard-dev"
vnet_name                   = "vnet-aksstandard-dev"
subnet_cidr                 = "10.1.0.0/22"
network_security_group_name = "nsg-aks-wesco-standard-dev"
pendpoint_cidr              = "10.1.5.0/24"
pendpoint_subnetname        = "pe-aks-wesco-standard-dev"
acr_name                    = "acrstandarddev"
appgw_cidr                  = "10.1.6.0/24"
appgw_subnetname            = "appgw subnet name"
