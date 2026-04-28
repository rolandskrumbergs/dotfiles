---
name: gdpr-compliant
description: 'Apply GDPR-compliant engineering practices across your codebase. Use this skill whenever you are designing APIs, writing data models, building authentication flows, implementing logging, handling user data, writing retention/deletion jobs, designing cloud infrastructure, or reviewing pull requests for privacy compliance. Trigger this skill for any task involving personal data, user accounts, cookies, analytics, emails, audit logs, encryption, pseudonymization, anonymization, data exports, breach response, CI/CD pipelines that process real data, or any question framed as "is this GDPR-compliant?". Inspired by CNIL developer guidance and GDPR Articles 5, 25, 32, 33, 35.'
---

# GDPR Engineering Skill

Actionable GDPR reference for engineers, architects, DevOps, and tech leads.
Inspired by CNIL developer guidance and GDPR Articles 5, 25, 32, 33, 35.

> **Golden Rule:** Collect less. Store less. Expose less. Retain less.

For deep dives, see the reference sections at the end of this document:
- [Data Rights, Accountability & Governance](#reference--data-rights-accountability--governance) — user rights endpoints, DSR workflow, RoPA
- [Security, Operations & Architecture](#reference--security-operations--architecture) — encryption, hashing, secrets, anonymization, cloud, CI/CD, incident response

---

## 1. Core GDPR Principles (Article 5)

| Principle | Engineering obligation |
|---|---|
| Lawfulness, fairness, transparency | Document legal basis for every processing activity in the RoPA |
| Purpose limitation | Data collected for purpose A **MUST NOT** be reused for purpose B without a new legal basis |
| Data minimization | Collect only fields with a documented business need today |
| Accuracy | Provide update endpoints; propagate corrections to downstream stores |
| Storage limitation | Define TTL at schema design time — never after |
| Integrity & confidentiality | Encrypt at rest and in transit; restrict and audit access |
| Accountability | Maintain evidence of compliance; RoPA ready for DPA inspection at any time |

---

## 2. Privacy by Design & by Default

**MUST**
- Add `CreatedAt`, `RetentionExpiresAt` to every table holding personal data at creation time.
- Default all optional data collection to **off**. Users opt in; they never opt out of a default-on setting.
- Conduct a **DPIA** before building high-risk processing (biometrics, health data, large-scale profiling, systematic monitoring).
- Update the **RoPA** with every new feature that introduces a processing activity.
- Sign a **DPA** with every sub-processor before data flows to them.

**MUST NOT**
- Ship a new data collection feature without a documented legal basis.
- Enable analytics, tracking, or telemetry by default without explicit consent.
- Store personal data in a system not listed in the RoPA.

---

## 3. Data Minimization

**MUST**
- Map every DTO/model field to a concrete business need. Remove undocumented fields.
- Use **separate DTOs** for create, read, and update — never reuse the same object.
- Return only what the caller is authorized to see — use response projections.
- Mask sensitive values at the edge: return `****1234` for card numbers, never the full value.
- Exclude sensitive fields (DOB, national ID, health) from default list/search projections.

**MUST NOT**
- Log full request/response bodies if they may contain personal data.
- Include personal data in URL path segments or query parameters (CDN logs, browser history).
- Collect `dateOfBirth`, national ID, or health data without an explicit legal basis.

---

## 4. Purpose Limitation

**MUST**
- Document the purpose of every processing activity in code comments and in the RoPA.
- Obtain a new legal basis or perform a compatibility analysis before reusing data for a secondary purpose.

**MUST NOT**
- Share personal data collected for service delivery with advertising networks without explicit consent.
- Use support ticket content to train ML models without a separate legal basis and user notice.

---

## 5. Storage Limitation & Retention

**MUST**
- Every table holding personal data **MUST** have a defined retention period.
- Enforce retention automatically via a scheduled job (Hangfire, cron) — never a manual process.
- Anonymize or delete data when retention expires — never leave expired data silently in production.

**Recommended defaults**

| Data type | Max retention |
|---|---|
| Auth / audit logs | 12–24 months |
| Session / refresh tokens | 30–90 days |
| Email / notification logs | 6 months |
| Inactive user accounts | 12 months after last login → notify → delete |
| Payment records | As required by tax law (7–10 years), minimized |
| Analytics events | 13 months |

**SHOULD**
- Add `RetentionExpiresAt` column — compute at insert time.
- Use soft-delete (`DeletedAt`) with a scheduled hard-delete after the erasure request window (30 days).

**MUST NOT**
- Retain personal data indefinitely "in case it becomes useful later."

---

## 6. API Design Rules

**MUST**
- MUST NOT include personal data in URL paths or query parameters.
  - `GET /users/{userId}`
- Authenticate all endpoints that return or accept personal data.
- Extract the acting user's identity from the JWT — never from the request body.
- Validate ownership on every resource: `if (resource.OwnerId != currentUserId) return 403`.
- Use UUIDs or opaque identifiers — never sequential integers as public resource IDs.

**SHOULD**
- Rate-limit sensitive endpoints (login, data export, password reset).
- Set `Referrer-Policy: no-referrer` and an explicit `CORS` allowlist.

**MUST NOT**
- Return stack traces, internal paths, or database errors in API responses.
- Use `Access-Control-Allow-Origin: *` on authenticated APIs.

---

## 7. Logging Rules

**MUST**
- Anonymize IPs in application logs — mask last octet (IPv4) or last 80 bits (IPv6).
  - `192.168.1.xxx`
- MUST NOT log: passwords, tokens, session IDs, credentials, card numbers, national IDs, health data.
- MUST NOT log full request/response bodies where PII may be present.
- Enforce log retention — purge automatically after the defined period.

**SHOULD**
- Log **events** not data: `"User {UserId} updated email"` not `"Email changed from a@b.com to c@d.com"`.
- Use structured logging (JSON) with `userId` as an internal identifier, not the email address.
- Separate audit logs (sensitive access, admin actions) from application logs — different retention and ACLs.

---

## 8. Error Handling

**MUST**
- Return generic error messages — never expose stack traces, internal paths, or DB errors.
  - ❌ `"Column 'email' violates unique constraint on table 'users'"`
  - ✅ `"A user with this email address already exists."`
- Use **Problem Details (RFC 7807)** for all error responses.
- Log the full error server-side with a correlation ID; return only the correlation ID to the client.

**MUST NOT**
- Include file paths, class names, or line numbers in error responses.
- Include personal data in error messages (e.g., "User john@example.com not found").

---

## 9. Encryption (summary — see [Security Reference](#encryption-1) for full detail)

| Scope | Minimum standard |
|---|---|
| Standard personal data | AES-256 disk/volume encryption |
| Sensitive data (health, financial, biometric) | AES-256 **column-level** + envelope encryption via KMS |
| In transit | TLS 1.2+ (prefer 1.3); HSTS enforced |
| Keys | HSM-backed KMS; rotate DEKs annually |

**MUST NOT** allow TLS 1.0/1.1, null cipher suites, or hardcoded encryption keys.

---

## 10. Password Hashing

**MUST**
- Use **Argon2id** (recommended) or **bcrypt** (cost ≥ 12). Never MD5, SHA-1, or SHA-256.
- Use a unique salt per password. Store only the hash.

**MUST NOT**
- Log passwords in any form. Transmit passwords in URLs. Store reset tokens in plaintext.

---

## 11. Secrets Management

**MUST**
- Store all secrets in a KMS: Azure Key Vault, AWS Secrets Manager, GCP Secret Manager, or HashiCorp Vault.
- Use pre-commit hooks (`gitleaks`, `detect-secrets`) to prevent secret commits.
- Rotate secrets on developer offboarding, annual schedule, or suspected compromise.

**`.gitignore` MUST include:** `.env`, `.env.*`, `*.pem`, `*.key`, `*.pfx`, `*.p12`, `secrets/`

**MUST NOT**
- Commit secrets to source code. Store secrets as plain-text environment variable defaults.

---

## 12. Anonymization & Pseudonymization (summary — see [Security Reference](#anonymization--pseudonymization) for full detail)

- **Anonymization** = irreversible → falls outside GDPR scope. Use for retained records after erasure.
- **Pseudonymization** = reversible with a key → still personal data, reduced risk.
- When erasing a user, anonymize records that must be retained (financial, audit) rather than deleting them.
- Store the pseudonymization key in the KMS — never in the same database as the pseudonymized data.

**MUST NOT** call data "anonymized" if re-identification is possible through linkage attacks.

---

## 13. Testing with Fake Data

**MUST**
- MUST NOT use production personal data in dev, staging, or CI environments.
- MUST NOT restore production DB backups to non-production without scrubbing PII first.
- Use synthetic data generators: `Bogus` (.NET), `Faker` (JS/Python/Ruby).
- Use `@example.com` for all test email addresses.

---

## 14. Anti-Patterns

| Anti-pattern | Correct approach |
|---|---|
| PII in URLs | Opaque UUIDs as public identifiers |
| Logging full request bodies | Log structured event metadata only |
| "Keep forever" schema | TTL defined at design time |
| Production data in dev/test | Synthetic data + scrubbing pipeline |
| Shared credentials across teams | Individual accounts + RBAC |
| Hardcoded secrets | KMS + secret manager |
| `Access-Control-Allow-Origin: *` on auth APIs | Explicit CORS allowlist |
| Storing consent with profile data | Dedicated consent store |
| PII in GET query params | POST body or authenticated session |
| Sequential integer IDs in public URLs | UUIDs |
| "Anonymized" data with quasi-identifiers | Apply k-anonymity, test linkage resistance |
| Mixing backup regions outside EEA | Explicit region lockdown on backup jobs |

---

## 15. PR Review Checklist

### Data model
- Every new PII column has a documented purpose and retention period.
- Sensitive fields (health, financial, national ID) use column-level encryption.
- No sequential integer PKs as public-facing identifiers.

### API
- No PII in URL paths or query parameters.
- All endpoints returning personal data are authenticated.
- Ownership checks present — user cannot access another user's resource.
- Rate limiting applied to sensitive endpoints.

### Logging
- No passwords, tokens, or credentials logged.
- IPs anonymized (last octet masked).
- No full request/response bodies logged where PII may be present.

### Infrastructure
- No public storage buckets or public-IP databases.
- New cloud resources tagged with `DataClassification`.
- Encryption at rest enabled for new storage resources.
- New geographic regions for data storage are EEA-compliant or covered by SCCs.

### Secrets & CI/CD
- No secrets in source code or committed config files.
- New secrets added to KMS and secrets inventory document.
- CI/CD secrets masked in pipeline logs.

### Retention & erasure
- Retention enforcement job or policy covers new data store or field.
- Erasure pipeline updated to cover new data store.

### User rights & governance
- Data export endpoint includes any new personal data field.
- RoPA updated if a new processing activity is introduced.
- New sub-processors have a signed DPA and a RoPA entry.
- DPIA triggered if the change involves high-risk processing.

---

> **Golden Rule:** Collect less. Store less. Expose less. Retain less.
>
> Every byte of personal data you do not collect is a byte you cannot lose,
> cannot breach, and cannot be held liable for.

---

*Inspired by CNIL developer GDPR guidance, GDPR Articles 5, 25, 32, 33, 35,
ENISA, OWASP, and NIST engineering best practices.*

---
---

# Reference — Security, Operations & Architecture

Detailed implementation guidance on encryption, password hashing, secrets management,
anonymization/pseudonymization, cloud/DevOps practices, CI/CD controls, incident response,
and architecture patterns.

---

## Encryption

### At-Rest Encryption

| Data sensitivity | Minimum standard |
|---|---|
| Standard personal data (name, address, email) | AES-256 disk/volume encryption (cloud provider default) |
| Sensitive personal data (health, biometric, financial, national ID) | AES-256 **column-level** encryption + envelope encryption via KMS |
| Encryption keys | HSM-backed KMS (Azure Key Vault Premium / AWS KMS CMK / GCP Cloud KMS) |

**Envelope encryption pattern:**
1. Encrypt data with a **Data Encryption Key (DEK)** (AES-256, generated per record or per table).
2. Encrypt the DEK with a **Key Encryption Key (KEK)** stored in the KMS.
3. Store the encrypted DEK alongside the encrypted data.
4. Deleting the KEK = effective crypto-shredding of all data encrypted with it.

### In-Transit Encryption

- **MUST** enforce TLS 1.2 minimum; prefer TLS 1.3.
- **MUST** set `Strict-Transport-Security: max-age=31536000; includeSubDomains; preload`.
- **MUST NOT** allow TLS 1.0, TLS 1.1, null cipher suites, or export-grade ciphers.
- **MUST NOT** use self-signed certificates in production.

### Key Management

- Rotate DEKs annually minimum; rotate immediately upon suspected compromise.
- Use separate key namespaces per environment (dev / staging / prod).
- Log all KMS key access events — alert on anomalous access patterns.
- MUST NOT hardcode encryption keys in source code or configuration files.

---

## Password Hashing

| Algorithm | Parameters | Notes |
|---|---|---|
| **Argon2id** ✅ recommended | memory ≥ 64 MB, iterations ≥ 3, parallelism ≥ 4 | OWASP and NIST recommended |
| **bcrypt** ✅ acceptable | cost factor ≥ 12 | Widely supported; use if Argon2id unavailable |
| **scrypt** ✅ acceptable | N=32768, r=8, p=1 | Good alternative |
| MD5 ❌ | — | Never — trivially broken |
| SHA-1 / SHA-256 ❌ | — | Never for passwords — not designed for this purpose |

**MUST**
- Use a unique salt per password (built into all three algorithms above).
- Store only the hash — never the plaintext, never a reversible encoding.
- Re-hash on login if the stored hash uses an outdated algorithm — upgrade transparently.

**SHOULD**
- Add a **pepper** (server-side secret added before hashing) stored in the KMS, not in the DB.
- Check passwords against known breach lists at registration (`haveibeenpwned` API, k-anonymity mode).
- Enforce minimum password length of 12 characters.

**MUST NOT**
- Log passwords in any form — not during registration, not during failed login.
- Transmit passwords in URLs or query strings.
- Store password reset tokens in plaintext — hash them before storage.

---

## Secrets Management

**MUST**
- Store all secrets in a dedicated secret manager: Azure Key Vault, AWS Secrets Manager,
  GCP Secret Manager, or HashiCorp Vault.
- Use pre-commit hooks to prevent secret commits: `gitleaks`, `detect-secrets`, GitHub native secret scanning.
- Rotate secrets immediately upon: developer offboarding, suspected compromise, annual schedule.
- Maintain a **secrets inventory document** — every secret listed with its purpose and rotation date.

**SHOULD**
- Use **short-lived credentials** via OIDC federation (GitHub Actions → Azure/AWS/GCP) instead of long-lived API keys.
- Audit all KMS secret access — alert on access outside business hours or from unexpected sources.
- Use separate secret namespaces per environment.

**`.gitignore` MUST include:**
```
.env
.env.*
*.pem
*.key
*.pfx
*.p12
secrets/
appsettings.*.json   # if it may contain connection strings
```

**MUST NOT**
- Commit secrets to source code repositories.
- Pass secrets as plain-text CLI arguments (they appear in process lists and shell history).
- Store secrets as unencrypted environment variable defaults in code.

---

## Anonymization & Pseudonymization

### Definitions

| Term | Reversible? | GDPR scope? | Use case |
|---|---|---|---|
| **Anonymization** | No | Outside GDPR scope | Retained records after erasure, analytics datasets |
| **Pseudonymization** | Yes (with key) | Still personal data | Analytics pipelines, audit logs, reduced-risk processing |

### Anonymization Techniques

| Technique | How | When |
|---|---|---|
| Suppression | Remove the field entirely | Fields with no analytical value |
| Masking | Replace with fixed placeholder (`"ANONYMIZED_USER"`) | Audit log identifiers after erasure |
| Generalization | Replace exact value with a range (age 34 → "30–40") | Analytics |
| Noise addition | Add statistical noise to numerical values | Aggregate analytics |
| Aggregation | Report group statistics, never individual values | Reporting |
| K-anonymity | Ensure each record is indistinguishable from k-1 others | Analytics datasets |

### Pseudonymization Techniques

| Technique | How |
|---|---|
| HMAC-SHA256 with secret key | Consistent, one-way, keyed. Use for user IDs in analytics. Key in KMS. |
| Tokenization | Replace value with opaque token; mapping in separate secure vault. |
| Encryption with separate key | Decrypt only with explicit KMS authorization. |

**MUST**
- When erasing a user, **anonymize** records that must be retained (financial, audit logs) — replace identifying fields with `"ANONYMIZED"` or a hashed placeholder.
- Store the pseudonymization key in the KMS — never in the same database as the pseudonymized data.
- Test anonymization routines with assertions: the original value MUST NOT be recoverable from the output.

**Crypto-shredding pattern (event sourcing):**
Encrypt personal data in events with a per-user DEK. Store the DEK in the KMS.
On erasure: delete the DEK from the KMS → all events for that user are effectively anonymized.

**MUST NOT**
- Call data "anonymized" if re-identification is possible through linkage with other datasets.
- Apply pseudonymization and store the mapping key in the same table as the pseudonymized data.

---

## Cloud & DevOps Practices

**MUST**
- Enable encryption at rest for all cloud storage: blobs, managed databases, queues, caches.
- Use **private endpoints** — databases MUST NOT be publicly accessible.
- Apply network security groups / firewall rules: restrict DB access to application layers only.
- Enable cloud-native audit logging: Azure Monitor / AWS CloudTrail / GCP Cloud Audit Logs.
- Store personal data only in **approved geographic regions** (EEA, or adequacy decision / SCCs).
- Tag all cloud resources processing personal data with a `DataClassification` tag.

**SHOULD**
- Enable Microsoft Defender for Cloud / AWS Security Hub / GCP SCC — review recommendations weekly.
- Use **managed identities** (Azure) or **IAM roles** (AWS/GCP) instead of long-lived access keys.
- Enable soft delete and versioning on object storage.
- Apply DLP policies on cloud storage to detect PII written to unprotected buckets.
- Enable database-level audit logging for SELECT on sensitive tables.

**MUST NOT**
- Store personal data in public storage buckets without access controls.
- Deploy databases with public IPs in production.
- Use the same cloud account/subscription for production and non-production if data could bleed across.

---

## CI/CD Controls

**MUST**
- Run **secret scanning** on every commit: `gitleaks`, `detect-secrets`, GitHub secret scanning.
- Run **dependency vulnerability scanning** on every build: `npm audit`, `dotnet list package --vulnerable`, `trivy`, `snyk`.
- MUST NOT use real personal data in CI test jobs.
- MUST NOT log environment variables in CI pipelines — mask all secrets.

**SHOULD**
- Run **SAST**: SonarQube, Semgrep, or CodeQL on every PR.
- Run **container image scanning**: `trivy`, Snyk Container, or AWS ECR scanning.
- Add a **GDPR compliance gate** to the pipeline:
  - New migrations without a documented retention period → fail.
  - Log statements containing known PII field names → warn.

**Pipeline secret rules:**
```yaml
# MUST: mask secrets before use
- name: Mask secret
  run: echo "::add-mask::${{ secrets.MY_SECRET }}"

# MUST NOT: echo secrets to console
- run: echo "Key=$API_KEY"   # Never

# SHOULD: use OIDC federation (no long-lived keys)
- uses: azure/login@v1
  with:
    client-id: ${{ vars.AZURE_CLIENT_ID }}
    tenant-id: ${{ vars.AZURE_TENANT_ID }}
    subscription-id: ${{ vars.AZURE_SUBSCRIPTION_ID }}
```

---

## Incident & Breach Handling

### Regulatory Timeline

| Window | Obligation |
|---|---|
| **72 hours** from awareness | Notify the supervisory authority (CNIL, APD, ICO…) — unless breach is unlikely to risk individuals |
| **Without undue delay** | Notify affected data subjects if breach is likely to result in **high risk** to their rights |

Log **all** personal data breaches internally — even those that do not require DPA notification.

### Breach Response Runbook (template)

1. **Detection** — Define criteria: what triggers an incident (credential leak, DB dump exposed, ransomware, accidental public bucket).
2. **Severity classification** — Low / Medium / High / Critical based on data sensitivity and volume.
3. **Containment** — Revoke compromised credentials; isolate affected systems; preserve evidence (do NOT delete logs).
4. **Assessment** — What data was exposed? How many subjects? What is the risk level?
5. **DPA notification** — Use the supervisory authority's online portal; include: nature of breach, categories and approximate number of data subjects, categories and approximate number of records, contact point, likely consequences, measures taken.
6. **Data subject notification** — If high risk: clear language, nature of breach, likely consequences, measures taken, DPO contact.
7. **Post-incident review** — Root cause analysis; corrective measures; update runbook.

### Automated Breach Detection Alerts

Configure alerts for:
- Unusual volume of data exports (threshold per hour)
- Access to sensitive tables outside business hours
- Bulk deletion events
- Failed authentication spikes
- New credentials appearing in public breach databases (HaveIBeenPwned monitoring)

Store breach records internally for at least **5 years**.

---

## Architecture Patterns

### Data Store Separation
Separate operational data (transactional DB) from analytical data (data warehouse).
Apply different retention periods and access controls to each.
The analytics store MUST NOT read directly from production operational tables.

### Dedicated Consent Store
Track consent as an immutable event log in a separate store, not a boolean column on the user table.
This enables: auditable consent history, version tracking, easy withdrawal without data loss.

### Audit Log Segregation
Store audit logs in a separate, append-only store.
The application service account MUST NOT be able to delete audit log entries.
Use a separate DB user with INSERT-only rights on the audit table.

### DSR Queue Pattern
Implement Data Subject Requests as an asynchronous workflow:
`POST /api/v1/me/erasure-request` → enqueue a job → worker scrubs all stores → notify user on completion.
This handles the complexity of multi-store scrubbing reliably and provides a retry mechanism.

### Pseudonymization Gateway
For analytics pipelines, implement a pseudonymization service at the boundary between
operational and analytical systems.
The mapping key (HMAC secret or tokenization vault) never leaves the operational zone.
The analytics zone receives only pseudonymized identifiers.

### Crypto-Shredding (Event Sourcing)
Encrypt personal data in events with a per-user DEK stored in the KMS.
On user erasure: delete the DEK → all historical events for that user are effectively anonymized
without modifying the event log.

---
---

# Reference — Data Rights, Accountability & Governance

Detailed implementation guidance on user rights endpoints, Data Subject Request (DSR) workflow,
Record of Processing Activities (RoPA), and consent management.

---

## User Rights Implementation (Articles 15–22)

Every right MUST have a tested API endpoint or documented back-office process
before the system goes live. Respond to verified requests within **30 calendar days**.

| Right | Article | Engineering implementation |
|---|---|---|
| Right of access | 15 | `GET /api/v1/me/data-export` — all personal data, JSON or CSV |
| Right to rectification | 16 | `PUT /api/v1/me/profile` — propagate to all downstream stores |
| Right to erasure | 17 | `DELETE /api/v1/me` — scrub all stores per erasure checklist |
| Right to restriction | 18 | `ProcessingRestricted` flag on user record; gate non-essential processing |
| Right to portability | 20 | Same as access endpoint; structured, machine-readable (JSON) |
| Right to object | 21 | Opt-out endpoint for legitimate-interest processing; honor immediately |
| Automated decision-making | 22 | Expose a human review path + explanation of the logic |

### Erasure Checklist — MUST cover all stores

When `DELETE /api/v1/me` is called, the erasure pipeline MUST scrub:

- Primary relational database (anonymize or delete rows)
- Read replicas
- Search index (Elasticsearch, Azure Cognitive Search, etc.)
- In-memory cache (Redis, IMemoryCache)
- Object storage (S3, Azure Blob — profile pictures, documents)
- Email service logs (Brevo, SendGrid — delivery logs)
- Analytics platform (Mixpanel, Amplitude, GA4 — user deletion API)
- Audit logs (anonymize identifying fields — do not delete the event)
- Backups (document the backup TTL; accept that backups expire naturally)
- CDN edge cache (purge if personal data may be cached)
- Third-party sub-processors (trigger their deletion API or document the manual step)

### Data Export Format (`GET /api/v1/me/data-export`)

```json
{
  "exportedAt": "2025-03-30T10:00:00Z",
  "subject": {
    "id": "uuid",
    "email": "user@example.com",
    "createdAt": "2024-01-15T08:30:00Z"
  },
  "profile": { },
  "orders": [ ],
  "consents": [ ],
  "auditEvents": [ ]
}
```

- MUST be machine-readable (JSON preferred, CSV acceptable).
- MUST NOT be a PDF screenshot or HTML page.
- MUST include all stores listed in the RoPA for this user.

### DSR Tracker (back-office)

Implement a **Data Subject Request tracker** with:
- Incoming request date
- Request type (access / rectification / erasure / portability / restriction / objection)
- Verification status (identity confirmed y/n)
- Deadline (received date + 30 days)
- Assigned handler
- Completion date and outcome
- Notes

Automate the primary store scrubbing; document manual steps for third-party stores.

---

## Record of Processing Activities (RoPA)

Maintain as a living document (Markdown, YAML, or JSON) version-controlled in the repo.
Update with **every** new feature that introduces a processing activity.

### Minimum fields per processing activity

```yaml
- name: "User account management"
  purpose: "Create and manage user accounts for service access"
  legalBasis: "Contract (Art. 6(1)(b))"
  dataSubjects: ["Registered users"]
  personalDataCategories: ["Name", "Email", "Password hash", "IP address"]
  recipients: ["Internal engineering team", "Brevo (email delivery)"]
  retentionPeriod: "Account lifetime + 12 months"
  transfers:
    outside_eea: true
    safeguard: "Brevo — Standard Contractual Clauses (SCCs)"
  securityMeasures: ["TLS 1.3", "AES-256 at rest", "bcrypt password hashing"]
  dpia_required: false
```

### Legal basis options (Art. 6)

| Basis | When to use |
|---|---|
| `Contract (6(1)(b))` | Processing necessary to fulfill the service contract |
| `Legitimate interest (6(1)(f))` | Fraud prevention, security, analytics (requires balancing test) |
| `Consent (6(1)(a))` | Marketing, non-essential cookies, optional profiling |
| `Legal obligation (6(1)(c))` | Tax records, anti-money-laundering |
| `Vital interest (6(1)(d))` | Emergency situations only |
| `Public task (6(1)(e))` | Public authorities |

---

## Consent Management

### MUST

- Store consent as an **immutable event log**, not a mutable boolean flag.
- Record: what was consented to, when, which version of the privacy policy, the mechanism.
- Load analytics / marketing SDKs **conditionally** — only after consent is granted.
- Provide a consent withdrawal mechanism as easy to use as the consent grant.

### Consent store schema (minimum)

```sql
CREATE TABLE ConsentRecords (
    Id          UUID PRIMARY KEY,
    UserId      UUID NOT NULL,
    Purpose     VARCHAR(100) NOT NULL,   -- e.g. "marketing_emails", "analytics"
    Granted     BOOLEAN NOT NULL,
    PolicyVersion VARCHAR(20) NOT NULL,
    ConsentedAt TIMESTAMPTZ NOT NULL,
    IpAddressHash VARCHAR(64),           -- HMAC-SHA256 of anonymized IP
    UserAgent   VARCHAR(500)
);
```

### MUST NOT

- MUST NOT pre-tick consent checkboxes.
- MUST NOT bundle consent for marketing with consent for service delivery.
- MUST NOT make service access conditional on marketing consent.
- MUST NOT use dark patterns (e.g., "Accept all" prominent, "Reject" buried).

---

## Sub-processor Management

Maintain a **sub-processor list** updated with every new SaaS tool or cloud service
that touches personal data.

Minimum fields per sub-processor:

| Field | Example |
|---|---|
| Name | Brevo |
| Service | Transactional email |
| Data categories transferred | Email address, name, email content |
| Processing location | EU (Paris) |
| DPA signed | ✅ 2024-01-10 |
| DPA URL / reference | [link] |
| SCCs applicable | N/A (EU-based) |

**MUST** review the sub-processor list annually and upon any change.
**MUST NOT** allow data to flow to a new sub-processor before a DPA is signed.

---

## DPIA Triggers (Article 35)

A DPIA is **mandatory** before processing that is likely to result in a high risk. Triggers include:

- Systematic and extensive profiling with significant effects on individuals
- Large-scale processing of special category data (health, biometric, racial origin, sexual orientation, religion)
- Systematic monitoring of publicly accessible areas (CCTV, location tracking)
- Processing of children's data at scale
- Innovative technology with unknown privacy implications
- Matching or combining datasets from multiple sources

When in doubt: conduct the DPIA anyway. Document the outcome.
