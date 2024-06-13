# AWS Multi-Region Terraform

![Terraform](https://img.shields.io/badge/Terraform-v1.4.6-blue)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![License](https://img.shields.io/github/license/Harishwin/aws-multi-region-terraform)

This repository contains Terraform configurations to deploy infrastructure across multiple AWS regions using Terraform. It allows for the deployment of two EC2 instances in different AWS regions (us-east-1 and us-east-2) with the same Terraform codebase. If you do not have access to an AWS account, you can use LocalStack to simulate AWS APIs for testing purposes.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Managing infrastructure across multiple AWS regions can be complex. This repository provides a Terraform solution to deploy two EC2 instances, each in a different AWS region (us-east-1 and us-east-2), using a single codebase. It leverages Terraform modules to create all necessary infrastructure components such as VPCs, subnets, and NAT gateways.

## Features

- **Multi-Region Deployment**: Deploy infrastructure in us-east-1 and us-east-2 simultaneously.
- **Instance Type**: Configure EC2 instances with type t2.small.
- **Modular Architecture**: Utilize Terraform modules for scalable and reusable infrastructure code.

## Prerequisites

Before using this repository, ensure you have:

- AWS CLI configured with appropriate credentials or LocalStack installed for local testing.
- Terraform installed (version 1.4.6 or higher).
- Basic understanding of AWS services and Terraform.

## Getting Started

To deploy infrastructure across multiple AWS regions using Terraform:

1. Clone this repository:

   ```bash
   git clone https://github.com/Harishwin/aws-multi-region-terraform.git
   cd aws-multi-region-terraform
