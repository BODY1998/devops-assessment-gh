# Terraform Infrastructure – README

## Overview
This Terraform project provisions the complete infrastructure required to deploy a containerized web application on **Google Cloud Platform (GCP)**.  
The configuration creates a fully operational **Google Kubernetes Engine (GKE)** cluster that serves as the platform for deploying and running containerized workloads.

The project is organized following infrastructure-as-code best practices, using modules, variables, and outputs to keep the configuration clean and reusable.

---

## Infrastructure Components

### 1. Google Kubernetes Engine (GKE) Cluster
The primary resource created by this project is a GKE cluster.

The cluster includes:
- A regional GKE cluster
- Configurable number of nodes
- Customizable node machine types
- Integration readiness for deploying workloads using Docker images stored in GCR

The cluster is created through the `modules/gke` Terraform module.

---

### 2. Google Cloud Provider Configuration
The project configures the Google provider with:
- **Project ID**
- **Region**
- **Authentication via a Service Account**

This enables secure interaction between Terraform and GCP resources.

---

### 3. Service Account (External Requirement)
A Google Cloud **Service Account** is required for Terraform authentication.  
This service account should have at minimum:

- `roles/container.admin` – to create and manage GKE
- `roles/storage.admin` – to interact with GCR
- `roles/compute.viewer` – for underlying compute resources

Its JSON key is used when running Terraform or CI/CD pipelines.

---

## Folder Structure


```
infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── providers.tf
├── terraform.tfvars
└── modules/
    ├── gke/
    |    ├── main.tf
    |    ├── outputs.tf
    |    └── variables.tf
    ├── artifact_registry/
    |    ├── main.tf
    |    ├── outputs.tf
    |    └── variables.tf
    ├── db/
    |    ├── main.tf
    |    ├── outputs.tf
    |    └── variables.tf
    ├── gke-network/
    |    ├── main.tf
    |    ├── outputs.tf
    |    └── variables.tf
    └── storage/
         ├── main.tf
         ├── outputs.tf
         └── variables.tf

--------------------------------------

backend/
├── main.tf
└── providers.tf
   

```

## How to Use the Project

### 1\. Initialize Terraform

`terraform init`

### 2\. Review and Customize Variables

## 

Adjust values in `variables.tf` such as:

-   `project_id`
    
-   `region`
    
-   `cluster_name`
    
-   `node_count`
    
-   `machine_type`

### 3\. Preview the Infrastructure

### 

`terraform plan`

### 4\. Apply Changes

### 

`terraform apply`

### 5\. Connect to the GKE Cluster

### 

After apply completes:

`gcloud container clusters get-credentials <cluster-name> \   --region <region> \   --project <project-id>`

* * *

## Outputs

### 

The following outputs are provided:

-   Cluster endpoint – Used by kubectl to connect
    
-   Cluster name / region – Useful for deployment automation
    
-   Any additional module outputs