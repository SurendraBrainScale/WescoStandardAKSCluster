#Terraform Settings Block
terraform {
  cloud {
    organization = "aks-standard-org"
    workspaces { name = "qa-aksStandardSpace" }
  }
  # Required Terraform  Providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.71.0" # Required Version Terraform
    }
  }
  required_version = ">= 1.1.0"
}

# Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
}