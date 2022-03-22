
[![RepoVisits](https://badges.pufler.dev/visits/SurendraBrainScale/WescoStandardAKSCluster)](https://badges.pufler.dev) ![GitHub top language](https://img.shields.io/github/languages/top/SurendraBrainScale/WescoStandardAKSCluster?style=plastic) ![GitHub last commit](https://img.shields.io/github/last-commit/SurendraBrainScale/WescoStandardAKSCluster?color=red&style=plastic) 

[![Generate terraform docs](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/documentation.yml/badge.svg)](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/documentation.yml)
[![tfsec](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/tfsec.yml/badge.svg)](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/tfsec.yml)
[![Terraform](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/terraform.yml/badge.svg)](https://github.com/SurendraBrainScale/WescoStandardAKSCluster/actions/workflows/terraform.yml)

# AKS Cluster - Wesco Standards
- [AKS Cluster - Wesco Standards](#aks-cluster---wesco-standards)
	- [Introduction](#introduction)
	- [Pre-requisites](#pre-requisites)
	- [Software Dependencies/Tools](#software-dependenciestools)
	- [Steps](#steps)
	- [Project structure](#project-structure)
		- [Terraform module structure](#terraform-module-structure)
		- [Checklist](#checklist)
	- [References - Utilities](#references---utilities)

## Introduction
How to create AKS cluster using Hashicorp Terraform as per the Wesco Standards. The AKS cluster in this guide supports the following features:

- AKS-managed Azure Active Directory integration
- Azure Monitor for Containers
- Automatic AKS version upgrades
- Separate node pools for user and system workloads
- A system assigned managed cluster identity
- Autoscaling node pools
- Availability Zone Configuration
- Azure Policy for Kubernetes

## Pre-requisites
- Azure Subscription
- Terraform Cloud Account

## Software Dependencies/Tools
- Terraform (IAC)
- Terraform Azure Provider plugin(Extension)
- Visual Studio Code Editor(Optional)
- Terraform Lint
- Terraform docs

## Steps
- Step1: Define an AKS Kubernetes cluster with Terraform as per the wesco standard
- Step2: Set up terraform cloud structure to store state files in Terraform Workspace
- Step3: Create the Kubernetes cluster
- Step4: Test the Kubernetes cluster
- Step5: Monitoring and logs

## Project structure
- **main**: deployment and modules folder contains the terraform scripts.

![image](https://user-images.githubusercontent.com/94529299/159233449-60ae6979-e4da-48b8-816f-645f7b1bd59f.png)
- **Deployment**: [deployment](deployment) folder contains details of multiple environments such as dev, prod and qa. 

![image](https://user-images.githubusercontent.com/94529299/159234282-470df9e9-d257-4fb2-8073-f32cd9216f7f.png)
- **modules**: [modules](modules) represent here in this layout the Terraform modules (general re-used functions) . We have basically 4 modules:
	 - **acr**: AKS Container Registry service
	 - **aks_cluster**: the main unit providing the AKS service
	 - **aks_network**: Create the cluster Virtual Network and subnetwork on Azure
	 - **log_analytics**: Container Insights is the unit that manages logs and cluster health checks.
	 - **privatednszone**: access the cluster in private dns zones
	 - **privateendpoint**: private end 

![image](https://user-images.githubusercontent.com/94529299/159234400-e3cecfe3-c55c-4313-a97d-d4901643a7b5.png)

### Terraform module structure
- The module is a container for multiple resources that are used together.
	 - [ ] **main.t**f: the aks cluster resources are packaged in the main.tf file
	 - [ ] **variables.tf**: In Terraform, modules can have input parameters, too. To define them, you use a mechanism input  	variables.
	 - [ ] **output.tf**: In Terraform, a module can also return values. Again, this is done using a mechanism: output variables.

### Checklist

**SNo**|**Category**|**Priority**|**Standard**|**Config Owner**|**Comments**|**Status**|**Remediation**|**Recommendation**
:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:
1|Development|High|Implement a proper Liveness probe|Application Development|This will be part of AKS Application onboarding question|Not Done|Required|All the deployment should be configured with Liveness probe 
2|Development|Medium|Implement a proper Startup probe|App team|depends on application requirements|NA|TBD|If there are application with longer startup time ,configured it to disables liveness and readiness checks until the application has completely  started up (booted-up)
3|Development|Low|Implement a proper prestop hook|App team | |NA|TBD|Na
4|Development|Medium|Implement a proper Readiness probe|App team| |Not Done|Required|All the deployment should be configured with  Readiness probe 
5|Development|Medium|Run more than one replica for your Deployment|App team / infra team| |Not Done|Required|Need min 3 replication per deployment 
7|Development|Low|Implement autoscaling of your applications|App team /infra team | |Not Done|Required|configure Horizontal Pod Auto scaling for Deployments to scale accordingly with CPU or RAM as scaling factor . For special requirements check "Kubernetes Event-driven Auto scaling" https://keda.sh/
8|Development|High|Store your secrets in Azure Key Vault, don't inject passwords in Docker Images|Application Development|This will be part of AKS Application onboarding question|Not Done|Required|To be checked with Application  team ,and find a solution to store and access secrets for Azure key vault
9|Development|Medium|Implement Pod Identity|App team|depends on application requirements|Not done|TBD|Configure pod identity to communicate with other azure services
10|Development|Medium|Use Kubernetes namespaces to properly isolate your Kubernetes resources|App team / infra team| |Done|Not required|NA
11|Development|High|Set up requests and limits on your containers|Application Development|This will be part of AKS Application onboarding question|Not Done|Required|Need to configure requests and limits on  containers for each deployment
12|Development|Medium|Specify the security context of your pod/container|App team / infra team| |Not Done|Required|Need to configured  security context for all   pod/container
14|Development|High|Conduct Dockerfile scanning to ensure Docker Image Security Best Practices|DevSecOps|Need to followup with Brenden|Not Done|TBD|Images should be copied to Wesco ACR and deploy to cluster,Yet to decide the scannng tools
15|Development|High|Static Analysis of Docker Images on Build|Application Development|Need to engage Security to Perfroming scan?|Not Done|TBD|Images should be copied to Wesco ACR and deploy to cluster,Yet to decide the scannng tools
16|Development|Medium|Threshold enforcement of Docker Image Builds that contain vulnerabilities|Security/ DevSecOps| |Not Done|TBD| 
17|Development|High|Compliance enforcement of Docker Image Builds|DevSecOps|Need to followup with Brenden|Not Done|TBD|Yet to decide the scannng tools
18|Development|Low|Use Azure Migrate to quick containerize your applications| | |NA|Not required| 
20|Development|Low|Don't use naked pods|App team | |Done|Not required| 
22|Image Management|High|Scan the container image against vulnerabilities|DevSecOps|Need to followup with Brenden|Not Done|TBD|Yet to decide the scannng tools
23|Image Management|Medium|Allow deploying containers only from known registries|App team / infra team / DevSecOps| |Done|Not required| 
24|Image Management|High|Runtime Security of Applications|DevSecOps|Need to followup with Brenden|Not Done|TBD|Yet to decide the scannng tools
25|Image Management|High|Quarantine of Docker Images in Docker Registries that have discovered issues|DevSecOps|Pipeline should not proceed with Image build to ACR|Not Done|TBD|Yet to decide the scannng tools
26|Image Management|High|Role-Based Access Contol (RBAC) to Docker Registries (ACR)|DevSecops/Infra Apps/Cloud|Need to review ACR RBAC|Not Done|Required|integrate with AKS or integrate all the ACRs with AKS 
27|Image Management|High|Network Segmentation of Docker Registries |DevOPS/Cloud|Review Current ACR & Plan for Private endpoints for new deployments|Not Done|Required|privet endpoint to be created in AKS Vnet
28|Image Management|Medium|Prefer distroless images|infra team / DevSecOps| |Not Done|TBD|To be checked with Application  team 
29|Cluster Setup|Medium|Logically isolate cluster|Infra team | |Done|Not required| 
30|Cluster Setup|High|Physically isolate cluster|Cloud|This is current Standard|Done|Not required| 
31|Cluster Setup|High|IP Range authorization|Cloud|Private Cluster is standard. Public cluster request will be reviewed case by case.|Not Done|Required|Migrate to private cluster or add AKS API  authorization IP Range
32|Cluster Setup|High|AAD Integration|Cloud|This is current Standard|Not Done|Required|Integrate AKS cluster with Azure AD
33|Cluster Setup|Medium|Use System Node Pools|Infra team |find the right sizing for system node|Not Done|Required|create separate node pool for system and application pod and Use the CriticalAddonsOnly=true:NoSchedule taint to prevent application pods from being scheduled on system node pools
34|Cluster Setup|High|AKS Managed Identity|Cloud|Managed Identiity is the Current standard|Done|Not required| 
35|Cluster Setup|Medium|VM Sizing|App team / infra team | |Done|Not required| 
38|Cluster Setup|High|K8S RBAC + AAD Integration|Cloud|Managed Identiity is the Current standard|Not Done|Required|enable and configure K8s RBAC and Azure AD 
39|Cluster Setup|High|Private cluster|Cloud|Managed Identiity is the Current standard|Not Done|Required|Redeploy AKS cluster as private cluster
40|Cluster Setup|Medium|Enable cluster auto scaling|Infra team | |Done|Not required| 
41|Cluster Setup|Medium|Sizing of the nodes|App team / infra team | |Done|Not required| 
42|Cluster Setup|Medium|Refresh container when base image is updated|App team / infra team /DevSecops /security| |Not Done|TBD|Need discussion on this
43|Cluster Setup|Medium|Check if you need the Kubernetes dashboard|Infra team |disable using terraform |Done|Not required|Use cluster insights for AKS 
44|Cluster Setup|Medium|Use AKS and ACR integration without password|Infra team | |Not Done|Required| integrate with AKS or integrate all the ACRs with AKS 
45|Cluster Setup|Low|Use placement proximity group to improve performance| | |NA|Not required|Current cluster node deployed in Availability Zone 
47|Cluster Setup|Medium|Enable traffic management|App team / infra team | |Not done|TBD| 
48|Cluster Setup|Medium|Enable geo-replication for container images|App team / infra team |enable in terraform |Not done|Required|Enable replication in ACR
50|Disater Recovery|High|Use availability zones|Cloud|Default Deployment use 3 AZ Deployment|Done|Not required| 
51|Disater Recovery|Medium|Plan for multiregion deployment|App team / infra team |based on usecase |Not done|TBD|Need discussion on this
52|Disater Recovery|Low|Use Azure Traffic Manager to route traffic|App team /infra team | |Not done|TBD|Need discussion on this
53|Disater Recovery|Low|Create a storage migration plan|infra team| |Done|Not required| 
54|Disater Recovery|Low|Guarantee SLA for the control plane|infra team| |Done|Not required| 
55|Disater Recovery|Low|Avoid Pods being placed into a single node|App team | |Not done|Required|increase replica count and use pod anti-affinity
56|Storage|High|Choose the right storage type|Cloud/Devlopment|Need to Develop Standard based on envirement/App Tier|Not done|TBD|Need discussion on this
58|Storage|Low|Dynamically provision volumes|infra team| |Done|Not required| 
59|Storage|Medium|Secure and back up your data|Infra team |velero is been used |Done|Not required| 
60|Storage|High|Make your storage resilient|Cloud|This will be based on Deployment /question|Not done|TBD|Make use of managed-premium storage class if required by app.
61|Network|Medium|Choose the appropriate network model|Infra team |Azure CNI is been used in all deployment |Done|Not required| 
63|Network|Medium|Distribute ingress traffic|App team / infra team |Application gateway ingress is used , |Not done|Required|deploy and use AGIC 
64|Network|Medium|Secure your exposed applications with a web application firewall (WAF)|App team / infra team | |Not done|Required|deploy and use AGIC 
65|Network|Medium|Don't expose your load-balancer on Internet if not necessary|App team / infra team | |Not done|Required|Configure ingress 
66|Network|Medium|Apply control on ingress hostnames|App team / infra team | |Not done|Required|deploy and use AGIC 
67|Network|Medium|Control traffic flow with network policies|App team / infra team | |Not done|Required|Create network policy as required.
68|Network|Medium|Configure default network policies in each namespace|App team / infra team | |Not done|Required|Create network policy as required.
69|Network|Medium|Prevent data-leaking with egress lockdown|Infra team |use Terraform to create route table|Not done|TBD|Need discussion on this
71|Network|Medium|Block Pod access to VMSS IMDS|App team / infra team |impliment using netwrok polices |Not done|Required|Create network policy as required.
72|Resource Management|Low|Enforce resource quotas|infra team| |Not done|Required|Enforce resource quotas on namespaces
73|Resource Management|Low|Namespaces should have LimitRange|infra team| |Not done|Required|Enforce  Limit Range on namespaces
74|Resource Management|Medium|Set memory limits and requests for all containers|App team /infra team |create namespace resource quotas using tearrform |Not done|Required|configure memory limits and requests for deployments
75|Resource Management|Low|Configure pod disruption budgets|App team| |Not done|TBD|Configure pod disruption budgets for each deployment 
76|Resource Management|Low|Set up cluster auto-scaling|infra team| |Done|Not required| 
77|Cluster Maintenance|Medium|Maintain kubernetes version up to date|cloud infra|n -2 version |Not done|Required|min version to be 1.22
78|Cluster Maintenance|High|Keep nodes up to date and patched|Cloud|Need to Develop Standard Patching Process|Not done|Required|need to upgrade to AKSUbuntu-1804gen2containerd-2022.01.24
79|Cluster Maintenance|Medium|Securely connect to nodes through a bastion host| |not required ,have vnet intigration with on prem network|Not done|Required|Cluster to be redeployed as privet cluster
81|Cluster Maintenance|Medium|Monitor the security of your cluster with Azure Security Center|cloud infra|Enabled|Not done|Required|upgrade Azure Security Center is in paid tier 
82|Cluster Maintenance|High|Provision a log aggregation tool|Cloud|Tools being evaluated|Done|Not required| 
83|Cluster Maintenance|High|Enable master node logs|Cloud|Document the Current standard|Done|Not required| 
84|Cluster Maintenance|High|Collect metrics|Cloud|Tools being evaluated|Done|Not required| 
85|Cluster Maintenance|Low|Configure distributed tracing|App team | |Not done|Required| 
86|Cluster Maintenance|Medium|Control the compliance with Azure Policies|cloud infra| |Not done|Required|Upgrade to enable defender for containers
88|Cluster Maintenance|High|Enable Azure Defender for Kubernetes|Cloud|Needs discussion.|Not done|Required|Upgrade to enable defender for containers
90|Cluster Maintenance|High|Use GitOps|Cloud/DevSecOps|Need to followup with Brenden|Not done|TBD|Need discussion on this
92|Cluster Maintenance|Medium|Don't use the default namespace|App team | |Done|Not required| 

## **References - Utilities**
- [terraform-docs](https://github.com/terraform-docs/terraform-docs) - utility to generate docs from terraform modules
- [tfsec](https://github.com/aquasecurity/tfsec) - Terraform static analysis tool
- [tflint](https://github.com/terraform-linters/tflint) - Terraform linter for detecting errors that can not be detected by terraform plan
