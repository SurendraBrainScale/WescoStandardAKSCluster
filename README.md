# Define AKS cluster with Terraform as per Wesco Standards

## Project structure  

- **modules**: represent here in this layout the Terraform modules (general re-used functions) . In this lab, we have basically 4 modules:
	 - [ ] **aks_cluster**: the main unit providing the AKS service
	 - [ ] **aks_identities**: the cluster identity unit that manage the cluster service principal
	 - [ ] **aks_network**: Create the cluster Virtual Network and subnetwork on Azure
	 - [ ] **log_analytics**: Formally Azure Operational Insight is the unit that manages logs and cluster health checks.
- **Deployment**: is the main function of this layout, responsible of the AKS Kubernetes cluster deployment on Azure. 
- In main.tf we define the Terraform modules already created in /modules sub-folder with the appropriate inputs defined in variables.tf.

