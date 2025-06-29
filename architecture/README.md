# Architecture Documentation

## Infrastructure Overview

This project implements a multi-environment infrastructure on Google Cloud Platform using Terraform with the following key components:

## 🏗️ High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Google Cloud Platform                    │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Dev Env   │  │ Staging Env │  │  Prod Env   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   VPC       │  │   Compute   │  │   Storage   │         │
│  │ Subnets     │  │   Instances │  │   Buckets   │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │     IAM     │  │ Cloud Build │  │ Terraform   │         │
│  │   Roles     │  │   Pipeline  │  │  Backend    │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

## 🔧 Component Details

### 1. Networking Layer
- **VPC**: Custom VPC with environment-specific naming
- **Subnets**: Regional subnets with CIDR range 10.10.0.0/24
- **Firewall Rules**: Default security configurations

### 2. Compute Layer
- **VM Instances**: Debian 12-based instances
- **Machine Type**: e2-medium (cost-effective)
- **Zones**: Environment-specific zone distribution

### 3. Storage Layer
- **GCS Buckets**: Regional storage buckets
- **Location**: Asia region for optimal performance
- **Lifecycle**: Configurable retention policies

### 4. Security Layer
- **IAM Roles**: Project-level permissions
- **Service Accounts**: Managed service identities
- **Access Control**: Principle of least privilege

### 5. CI/CD Layer
- **Cloud Build**: Automated deployment pipeline
- **Terraform Workspaces**: Environment isolation
- **State Management**: Remote backend storage

## 🌍 Environment Strategy

### Development Environment
- **Purpose**: Development and testing
- **Resources**: Minimal footprint
- **Access**: Developer access
- **Cost**: Optimized for cost

### Staging Environment
- **Purpose**: Pre-production testing
- **Resources**: Production-like configuration
- **Access**: QA and testing teams
- **Cost**: Balanced performance and cost

### Production Environment
- **Purpose**: Live application hosting
- **Resources**: High availability configuration
- **Access**: Restricted access
- **Cost**: Performance optimized

## 🔄 Deployment Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Code      │───▶│  Cloud      │───▶│  Terraform  │
│  Changes    │    │  Build      │    │  Apply      │
└─────────────┘    └─────────────┘    └─────────────┘
                          │
                          ▼
                   ┌─────────────┐
                   │ Environment │
                   │  Specific   │
                   │ Deployment  │
                   └─────────────┘
```

## 📊 Resource Allocation

| Environment | VMs | Storage | Network | IAM |
|-------------|-----|---------|---------|-----|
| Development | 1   | 1 Bucket| 1 VPC   | 1 Role|
| Staging     | 1   | 1 Bucket| 1 VPC   | 1 Role|
| Production  | 2   | 2 Bucket| 1 VPC   | 2 Role|

## 🔒 Security Considerations

1. **Network Security**
   - Isolated VPCs per environment
   - Restricted subnet access
   - Firewall rules enforcement

2. **Access Control**
   - Environment-specific IAM roles
   - Service account management
   - Audit logging enabled

3. **Data Protection**
   - Encrypted storage buckets
   - Secure state management
   - Backup and recovery procedures

## 📈 Scalability Design

The architecture supports horizontal and vertical scaling:

- **Horizontal**: Add more VM instances
- **Vertical**: Upgrade machine types
- **Storage**: Expand bucket capacity
- **Network**: Add additional subnets

## 🛡️ Disaster Recovery

- **State Backup**: Remote Terraform state
- **Data Backup**: GCS bucket replication
- **Configuration**: Version-controlled code
- **Documentation**: Comprehensive runbooks

## 📋 Compliance & Governance

- **Resource Tagging**: Environment and cost tracking
- **Audit Logging**: Comprehensive activity monitoring
- **Policy Enforcement**: Terraform validation rules
- **Documentation**: Architecture decision records 