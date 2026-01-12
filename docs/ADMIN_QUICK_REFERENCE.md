# 🔐 HHR-CPA Admin Quick Reference Card

> **Tenant:** `hhr-cpa-global.com` | **ID:** `e8b875bc-6cf4-4c2e-9ded-1371aaf26563`

---

## 👥 Key Accounts

| Account | Role | Domain Purpose |
|---------|------|----------------|
| hassan@hhr-cpa.us | Global Admin | Admin accounts |
| hassan@hhr-cpa-global.com | Contributor | Regular users |
| Masfaq@hhr-cpa-global.com | Security Admin | Security team |
| breakglass@hhr-cpa.us | Emergency | Break-glass only |

---

## 🌐 Essential Portals

| Portal | URL |
|--------|-----|
| Azure | <https://portal.azure.com> |
| Entra ID | <https://entra.microsoft.com> |
| M365 Admin | <https://admin.microsoft.com> |
| Security | <https://security.microsoft.com> |
| Compliance | <https://compliance.microsoft.com> |
| MFA Setup | <https://aka.ms/mfasetup> |

---

## 💳 Subscriptions

| Name | ID | Use |
|------|-----|-----|
| **HHR-CPA-Production** | `5d752a31-...` | Primary |
| HHR-CPA-AI-Dev | `d6ae787b-...` | AI/ML |
| HHR-CPA-Network-Sandbox | `47ad1444-...` | Testing |

---

## 🔒 Key Vault (hhr-cpa-team-vault)

**Admins:** hassan@hhr-cpa.us, hassan@hhr-cpa-global.com, Masfaq@hhr-cpa-global.com, breakglass@hhr-cpa.us

```powershell
# List secrets
az keyvault secret list --vault-name hhr-cpa-team-vault -o table

# Get secret
az keyvault secret show --vault-name hhr-cpa-team-vault --name "secret-name" --query value -o tsv
```

---

## 🔑 Masfaq's Access Summary

| Area | Access Level |
|------|--------------|
| Entra ID | Security Admin, Compliance Admin |
| Azure | Security Reader, Reader |
| Key Vault | Administrator (hhr-cpa-team-vault) |

---

## 🚨 Emergency Contacts

| Priority | Contact | When |
|----------|---------|------|
| 1 | Masfaq | Security incidents |
| 2 | Hassan | Escalations |
| 3 | breakglass@hhr-cpa.us | L1/L2 unavailable |

---

## ⚡ Quick Commands

```powershell
# Check your roles
az role assignment list --assignee "your-email" -o table

# List all users
az ad user list --query "[].{Name:displayName, UPN:userPrincipalName}" -o table

# Check subscription
az account show -o table

# Switch subscription
az account set --subscription "HHR-CPA-Production"
```

---

*Full guide: [ADMIN_TEAM_ONBOARDING.md](ADMIN_TEAM_ONBOARDING.md)*
