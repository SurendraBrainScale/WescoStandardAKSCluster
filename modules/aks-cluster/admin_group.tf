# Create Azure AD Group in Active Directory for AKS Admins
resource "azuread_group" "aks-aad-clusteradmins" {
   display_name = "AKSAdminstrators"
   description = "Kubernetes administrators for the cluster."
   owners = ["2d9376ce-bcf7-4539-82bd-1587353c8c05","73e5a7e5-cc25-4ad4-a3c8-1826fc07cdc8"]
   security_enabled = true
   mail_enabled = false  
}

