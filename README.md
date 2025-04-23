# super-duper-enigma

## Introduction
In this lab, you will design and implement a highly available, multi-region two-tier application architecture on AWS using Terraform. You’ll configure a remote state backend in S3 (with DynamoDB state locking), define multiple provider aliases for different regions, modularize your network and compute components, and orchestrate their deployment across `us-east-1` and `us-west-2`. This exercise will solidify your understanding of:

- Terraform backends
- Provider aliasing
- Module reuse
- Cross-region orchestration

## Learning Objectives
By the end of this lab, you will be able to:

1. Configure and initialize a Terraform remote backend with state locking.
2. Define and use multiple AWS provider aliases to target different regions.
3. Build reusable network and compute modules.
4. Deploy a two-tier (web + database) architecture across two AWS regions.
5. Troubleshoot common backend- and multi-region-related errors.

## Prerequisites
To complete this lab, you will need:

- An AWS account with permissions to create:
  - S3 buckets
  - DynamoDB tables
  - VPCs
  - EC2 instances
  - RDS instances
  - IAM roles
  - KMS keys
- Terraform v1.1+ installed
- AWS CLI configured (`aws configure`)
- Basic familiarity with:
  - Terraform CLI commands (`init`, `plan`, `apply`)
  - HCL syntax

## Lab Scenario
Your organization is launching a global web application that must remain available even if an entire region becomes unavailable. You’ve been tasked with automating the infrastructure-as-code so developers can spin up identical environments in both US East and US West regions. The architecture consists of:

- **Web Tier**: A public subnet hosting an EC2 instance running a simple web server.
- **Database Tier**: A private subnet hosting an RDS MySQL instance.

All Terraform state must be stored remotely in an encrypted S3 bucket with DynamoDB for state locking to prevent concurrent writes.

## Tasks
1. **Remote Backend Configuration**
2. **Provider Aliases for Multi-Region**
3. **Network Module (`modules/network`)**
4. **Compute Module (`modules/compute`)**
5. **Database Module (`modules/database`)**
6. **Root Module Orchestration**
7. **Initialization & Deployment**