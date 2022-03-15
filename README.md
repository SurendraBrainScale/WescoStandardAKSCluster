
# AKS Cluster - Wesco Standards

- [Introduction](#introduction)
- [Pre-requisites](#pre-requisites)
- [Software Dependencies](#software-dependencies)
- [Steps](#steps)
- [Project structure](#project-structure)
	- [Terraform module structure](#terraform-module-structure)

## Introduction
How to create AKS cluster using Hashicorp Terraform as per the Wesco Standards

## Pre-requisites
- Azure Subscription

## Software Dependencies
- Terraform
- Terraform Azure Provider plugin
- Visual Studio Code Editor(Optional)

## Steps
- Step1: Define an AKS Kubernetes cluster with Terraform
- Step2: Set up Azure storage to store Terraform state
- Step3: Create the Kubernetes cluster
- Step4: Test the Kubernetes cluster
- Step5: Monitoring and logs

## Project structure  

- **modules**: represent here in this layout the Terraform modules (general re-used functions) . We have basically 4 modules:
	 - [ ] **aks_cluster**: the main unit providing the AKS service
	 - [ ] **aks_identities**: the cluster identity unit that manage the cluster service principal
	 - [ ] **aks_network**: Create the cluster Virtual Network and subnetwork on Azure
	 - [ ] **log_analytics**: Formally Azure Operational Insight is the unit that manages logs and cluster health checks.
- **Deployment**: is the main function of this layout, responsible of the AKS Kubernetes cluster deployment on Azure. 
- In main.tf we define the Terraform modules already created in /modules sub-folder with the appropriate inputs defined in variables.tf.

![image](https://user-images.githubusercontent.com/94529299/158328000-a1ed36b0-41b6-40e1-90ed-1a9f390b87fd.png)


### Terraform module structure

![image](https://user-images.githubusercontent.com/94529299/158328623-01f1f965-8456-4654-af91-7294787e90d4.png)

- The module is a container for multiple resources that are used together.
	 - [ ] **main.t**f: the aks cluster resources are packaged in the main.tf file
	 - [ ] **variables.tf**: In Terraform, modules can have input parameters, too. To define them, you use a mechanism input  	variables.
	 - [ ] **output.tf**: In Terraform, a module can also return values. Again, this is done using a mechanism: output variables.
