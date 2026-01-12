# 🔐 HHR-CPA Admin Team Onboarding Guide

> **Last Updated:** January 11, 2026  
> **Tenant:** hhr-cpa-global.com  
> **Tenant ID:** `e8b875bc-6cf4-4c2e-9ded-1371aaf26563`

---

## 📋 Table of Contents

1. [Account Summary](#-account-summary)
2. [Access Matrix](#-access-matrix)
3. [First Login Checklist](#-first-login-checklist)
4. [Key Portals & URLs](#-key-portals--urls)
5. [Azure Subscriptions](#-azure-subscriptions)
6. [Key Vault Access](#-key-vault-access)
7. [Emergency Access](#-emergency-access)
8. [Security Contacts](#-security-contacts)

---

## 👥 Account Summary

### Domain Strategy

| Domain | Purpose | Example Users |
|--------|---------|---------------|
| `@hhr-cpa.us` | **Admin accounts** (privileged access) | hassan@hhr-cpa.us, breakglass@hhr-cpa.us |
| `@hhr-cpa-global.com` | **Regular users** (Entra ID, E5 licenses) | Masfaq@hhr-cpa-global.com, hassan@hhr-cpa-global.com |

### Active Accounts

| Account | Role | License | Notes |
|---------|------|---------|-------|
| `hassan@hhr-cpa.us` | Global Administrator | - | Primary admin account |
| `hassan@hhr-cpa-global.com` | User/Groups/App Admin | E5 | Contributor-level access |
| `Masfaq@hhr-cpa-global.com` | Security Administrator | E5 | Security team lead |
| `breakglass@hhr-cpa.us` | Global Administrator | - | Emergency access only |

---

## 🔑 Access Matrix

### Masfaq Ahmed (`Masfaq@hhr-cpa-global.com`)

#### Entra ID Roles
| Role | Scope | Purpose |
|------|-------|---------|
| Security Administrator | Directory | Manage security policies, alerts, incidents |
| Security Reader | Directory | View security reports and configurations |
| Compliance Administrator | Directory | Manage compliance features and DLP |

#### Azure Subscription Roles
| Role | Scope | Purpose |
|------|-------|---------|
| Security Reader | HHR-CPA-Production | View Defender for Cloud, security alerts |
| Reader | HHR-CPA-Production | View all Azure resources |

#### Key Vault Access
| Vault | Role | Purpose |
|-------|------|---------|
| hhr-cpa-team-vault | Key Vault Administrator | Full secrets/keys/certificates management |

### Hassan Rahman (`hassan@hhr-cpa-global.com`)

#### Entra ID Roles
| Role | Scope | Purpose |
|------|-------|---------|
| User Administrator | Directory | Manage users and groups |
| Groups Administrator | Directory | Manage all groups |
| Application Administrator | Directory | Manage app registrations |

#### Azure Subscription Roles
| Role | Scope | Purpose |
|------|-------|---------|
| Contributor | HHR-CPA-Production | Create/manage Azure resources |

#### Key Vault Access
| Vault | Role | Purpose |
|-------|------|---------|
| hhr-cpa-team-vault | Key Vault Administrator | Full secrets/keys/certificates management |

---

## ✅ First Login Checklist

### For New Team Members

- [ ] **Receive credentials** securely (not via email)
- [ ] **Sign in** at https://portal.azure.com
- [ ] **Complete MFA setup** (authenticator app recommended)
- [ ] **Verify access** to assigned portals (see below)
- [ ] **Change password** on first login (if temporary password provided)
- [ ] **Review security training** materials
- [ ] **Confirm Key Vault access** (if applicable)

### MFA Setup Steps

1. Go to https://aka.ms/mfasetup
2. Click "Add method" → "Authenticator app"
3. Download Microsoft Authenticator on your phone
4. Scan QR code and verify
5. Set authenticator as default method

---

## 🌐 Key Portals & URLs

### Microsoft 365 & Entra ID

| Portal | URL | Purpose |
|--------|-----|---------|
| Azure Portal | https://portal.azure.com | Azure resource management |
| Entra Admin Center | https://entra.microsoft.com | Identity & access management |
| Microsoft 365 Admin | https://admin.microsoft.com | M365 administration |
| Security Center | https://security.microsoft.com | Security alerts & incidents |
| Compliance Center | https://compliance.microsoft.com | DLP, retention, compliance |
| Exchange Admin | https://admin.exchange.microsoft.com | Email & mailbox management |

### Azure Security

| Portal | URL | Purpose |
|--------|-----|---------|
| Defender for Cloud | https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade | Cloud security posture |
| Azure Monitor | https://portal.azure.com/#blade/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade | Logs & metrics |
| Cost Management | https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu | Billing & budgets |

### Quick Links

| Task | URL |
|------|-----|
| MFA Setup | https://aka.ms/mfasetup |
| Password Reset | https://aka.ms/sspr |
| My Apps | https://myapps.microsoft.com |
| My Account | https://myaccount.microsoft.com |

---

## 💳 Azure Subscriptions

| Subscription | ID | Purpose | Monthly Budget |
|--------------|-----|---------|----------------|
| **HHR-CPA-Production** | `5d752a31-0c69-4d79-8bd3-1bc7d7100344` | Primary workloads | $150 |
| HHR-CPA-AI-Dev | `d6ae787b-49db-489a-9b2d-c7080a16ac16` | AI/ML development | $50 |
| HHR-CPA-Network-Sandbox | `47ad1444-26c4-4b48-b108-4e3717150d32` | Network testing | $20 |
| Azure subscription 1 | `3a03aa42-c06e-4bfc-bb64-7102efb0c99b` | Legacy/Testing | - |
| Subscription 1 | `91a4d87f-be54-489d-a2ae-1d8fde719267` | Legacy | - |

> ⚠️ **Note:** HHR-CPA STARTUP subscription (`9f758653-1a7c-4962-afea-e4233ce515e3`) has been transferred to another organization tenant.

---

## 🔒 Key Vault Access

### Production Key Vaults

| Vault Name | Resource Group | RBAC | Soft Delete | Purge Protection |
|------------|---------------|------|-------------|------------------|
| **hhr-cpa-team-vault** | hhr-cpa-security | ✅ | ✅ | ❌ |
| hhrcpakv01 | hhr-cpa-production | ✅ | ✅ | ❌ |
| azkvvbi222sxyujmu | - | ✅ | ✅ | ✅ |
| m365guarddevkv | m365guard-dev | ✅ | ✅ | ❌ |
| m365guarddevkvtds62imgfm | m365guard-dev | ✅ | ✅ | ✅ |
| m365guardprodkvtds62imgf | m365guard-prod | ✅ | ✅ | ✅ |

### Key Vault Administrator Access

| User | hhr-cpa-team-vault |
|------|-------------------|
| hassan@hhr-cpa.us | ✅ |
| hassan@hhr-cpa-global.com | ✅ |
| breakglass@hhr-cpa.us | ✅ |
| Masfaq@hhr-cpa-global.com | ✅ |

---

## 🚨 Emergency Access

### Break-Glass Account

| Property | Value |
|----------|-------|
| **Account** | `breakglass@hhr-cpa.us` |
| **Role** | Global Administrator |
| **Purpose** | Emergency access when primary admins unavailable |
| **MFA** | Hardware key (FIDO2) recommended |
| **Key Vault** | Key Vault Administrator on hhr-cpa-team-vault |

### Emergency Procedures

1. **Only use break-glass when:**
   - All Global Admins are locked out
   - Critical security incident requiring immediate access
   - Conditional Access policies blocking legitimate access

2. **After using break-glass:**
   - Document the incident immediately
   - Notify all Global Admins
   - Review sign-in logs
   - Rotate credentials if compromised

---

## � Secure Credential Delivery

### How to Share Passwords Securely

> ⚠️ **NEVER** send passwords via email, Teams chat, or commit to git repositories.

#### Option 1: Azure Key Vault (Recommended)

```powershell
# Store credential in Key Vault
az keyvault secret set --vault-name "hhr-cpa-team-vault" --name "user-temp-password" --value "SecurePassword123!"

# Share the secret name with the user, they retrieve it via:
az keyvault secret show --vault-name "hhr-cpa-team-vault" --name "user-temp-password" --query value -o tsv
```

#### Option 2: Microsoft Authenticator Passwordless

1. Admin creates account without password
2. User sets up Authenticator app at https://aka.ms/mfasetup
3. User uses passwordless sign-in (no password needed)

#### Option 3: Temporary Access Pass (TAP)

```powershell
# Create a one-time use TAP via Entra Admin Center
# Entra Admin Center → Users → [User] → Authentication methods → Add → Temporary Access Pass
# Valid for 1-24 hours, single use recommended
```

#### Option 4: Phone Call + Password Manager

1. Generate random password using password manager
2. Call the user directly (verify identity)
3. Read password over phone
4. User stores in their password manager
5. Force password change on first login

### Password Requirements

| Requirement | Value |
|-------------|-------|
| Minimum length | 14 characters |
| Complexity | Upper, lower, number, special |
| Expiry | 90 days (or never for service accounts) |
| History | Cannot reuse last 24 passwords |

---

## �📞 Security Contacts

### Escalation Path

| Level | Contact | Role | When to Contact |
|-------|---------|------|-----------------|
| 1 | Masfaq Ahmed | Security Administrator | Security incidents, policy questions |
| 2 | Hassan Rahman | Global Administrator | Escalated issues, access requests |
| 3 | Break-Glass | Emergency | Only when L1/L2 unavailable |

### External Resources

| Resource | Contact |
|----------|---------|
| Microsoft Support | https://admin.microsoft.com → Support |
| Azure Support | https://portal.azure.com → Help + Support |
| Security Incident | security@hhr-cpa.us |

---

## 📊 Defender for Cloud Status

### Current Tier Configuration

| Service | Tier | Monthly Cost |
|---------|------|--------------|
| Virtual Machines | Free | $0 |
| SQL Servers | Free | $0 |
| App Services | Free | $0 |
| Storage Accounts | Free | $0 |
| Key Vaults | Free | $0 |
| ARM | Free | $0 |
| SQL VMs | Standard | ~$15/server/month |
| Open Source DBs | Standard | ~$15/db/month |
| AI Services | Standard | Variable |
| Discovery | Standard | Included |

> **Total Estimated Security Cost:** ~$30-50/month (varies by usage)

---

## 📝 Revision History

| Date | Author | Changes |
|------|--------|---------|
| 2026-01-11 | Hassan Rahman | Initial creation - account setup and access matrix |

---

*This document contains sensitive access information. Store securely and share only with authorized personnel.*
