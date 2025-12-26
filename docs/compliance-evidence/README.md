# Compliance Evidence Archive

**Purpose:** Version-controlled storage for Microsoft Purview Compliance Manager assessments and audit evidence.

## Directory Structure

```
compliance-evidence/
├── baseline-2025-12-25/          # Initial baseline (Phase 1 complete)
│   ├── Cpa firm.pdf              # SOC 2 compliance assessment report
│   └── ExportActions (1).xlsx    # Improvement actions with scores
├── post-deployment-YYYY-MM-DD/   # Future: After CA policy deployment
└── README.md                     # This file
```

## How to Use This Archive

### 1. Baseline Assessment (Dec 25, 2025)
- **SOC 2 Assessment:** System and Organization Controls compliance
- **Exported From:** https://purview.microsoft.com/compliancemanager
- **Status:** Phase 1 complete (100%)
- **Score:** Documented in EXISTING-SETUP-INVENTORY.md (A+ grade)

**Files:**
- `Cpa firm.pdf` - Full compliance report with control details
- `ExportActions (1).xlsx` - Improvement actions spreadsheet

### 2. Post-Deployment Assessments (Future)
After deploying new controls or policies:
1. Export new reports from Purview Compliance Manager
2. Create new folder: `post-deployment-YYYY-MM-DD/`
3. Copy reports to new folder
4. Run comparison (manual or automated script)
5. Document improvements in git commit message

### 3. Comparison Process

**Manual Comparison:**
1. Open baseline `ExportActions (1).xlsx`
2. Open post-deployment Excel file
3. Compare scores in "Compliance Score" column
4. Document improvements in COMPLIANCE-MAPPING.md

**Automated Comparison (Phase 2 Goal):**
```bash
python scripts/compare_purview_reports.py \
  --baseline docs/compliance-evidence/baseline-2025-12-25/ExportActions.xlsx \
  --current docs/compliance-evidence/post-deployment-2025-XX-XX/ExportActions.xlsx \
  --output reports/compliance-improvement-YYYY-MM-DD.md
```

## Export Guide: How to Download Reports

### From Microsoft Purview Compliance Manager

**Method 1: Assessment Report (PDF)**
1. Navigate to: https://purview.microsoft.com/compliancemanager
2. Click **Assessments** tab
3. Find your assessment (e.g., "SOC 2")
4. Click **⋮** (three dots) → **Export to PDF**
5. Save as: `docs/compliance-evidence/post-deployment-YYYY-MM-DD/Assessment-YYYY-MM-DD.pdf`

**Method 2: Improvement Actions (Excel)**
1. Stay in **Assessments** tab
2. Click assessment name to open details
3. Click **Improvement actions** tab
4. Click **Export** button (top right)
5. Save as: `docs/compliance-evidence/post-deployment-YYYY-MM-DD/ExportActions-YYYY-MM-DD.xlsx`

**Method 3: Controls View**
1. Open assessment
2. Click **Controls** tab
3. Click **Export** button
4. Save as: `docs/compliance-evidence/post-deployment-YYYY-MM-DD/Controls-YYYY-MM-DD.xlsx`

## Audit Evidence Best Practices

### ✅ Do's
- Export reports after every major change (CA policies, Intune configs, etc.)
- Use consistent naming: `YYYY-MM-DD` format for folders
- Commit files with descriptive messages explaining what changed
- Keep original filenames from Purview (easier to track source)
- Document expected vs actual improvements in commit messages

### ❌ Don'ts
- Don't delete old baselines (version control preserves history)
- Don't edit Excel files directly (defeats version control purpose)
- Don't commit sensitive client data (firm-level assessments only)
- Don't skip commit messages (auditors need context)

## Git Workflow

### Adding New Evidence
```bash
# Create new folder
mkdir docs/compliance-evidence/post-deployment-2025-01-15

# Copy files from Downloads
cp ~/Downloads/ExportActions*.xlsx docs/compliance-evidence/post-deployment-2025-01-15/

# Stage changes
git add docs/compliance-evidence/

# Commit with details
git commit -m "docs: add post-deployment compliance evidence (Jan 15)

- SOC 2 score improved from 75% to 88% (+13%)
- Authentication controls: 70% → 95% (+25%)
- Access control: 65% → 90% (+25%)
- Evidence: ExportActions-2025-01-15.xlsx"

# Push to remote
git push origin main
```

## Compliance Timeline

| Date       | Event                           | Evidence Folder            | Score Change |
|------------|---------------------------------|----------------------------|--------------|
| 2025-12-25 | Phase 1 baseline                | baseline-2025-12-25/       | 75% (A+)     |
| 2025-XX-XX | CA policy deployment (Phase 2)  | post-deployment-2025-XX-XX | TBD          |
| 2025-XX-XX | Intune enhancements (Phase 3)   | post-deployment-2025-XX-XX | TBD          |
| 2026-XX-XX | Annual re-assessment            | annual-2026-XX-XX/         | TBD          |

## Related Documentation

- **[EXISTING-SETUP-INVENTORY.md](../policies/EXISTING-SETUP-INVENTORY.md)** - Current security controls (CA policies, devices, MFA)
- **[COMPLIANCE-MAPPING.md](../../COMPLIANCE-MAPPING.md)** - Framework mapping (SOX, GDPR, NIST, AICPA)
- **[PROJECT-STATUS.md](../../PROJECT-STATUS.md)** - Project phase status and milestones

## Support & Questions

For questions about:
- **Purview exports:** See "Export Guide" above
- **Comparison process:** See "Comparison Process" section
- **Git workflow:** See "Git Workflow" section
- **Automated scripts:** See Phase 2 roadmap in PROJECT-STATUS.md
