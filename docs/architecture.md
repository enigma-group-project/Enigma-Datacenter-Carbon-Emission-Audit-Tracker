# Architecture — Enigma-Datacenter-Carbon-Emission-Audit-Tracker

> Scenario: Data-center carbon-emission audit: accredited auditors anchor tamper-evident emission-evidence hashes so a regulator can verify a data center's reported carbon footprint without trusting a central database.

## Roles
- **Issuer** — Accredited Auditor (holds the issuer role; creates/updates/revokes CarbonRecord records)
- **Owner** — Data-Center Operator (controls transfer of their own record)
- **Verifier** — Regulator/Registry (read-only authenticity check)
- **Admin** — deploys, manages issuer roles, links the controller

## System diagram
```
            ┌──────────────────┐
complianceOfficer ─────▶│  IssuerRegistry  │◀──── isAuditor()/complianceOfficer() reads
            └──────────────────┘
                     ▲ role check
  issuer ──create──▶ │
            ┌──────────────────┐  controller-only   ┌──────────────┐
            │  RecordRegistry  │◀──────────────────│  AuditTrail  │◀── owner/issuer
            └──────────────────┘  transfer/revoke   └──────────────┘
                     ▲ view
            ┌──────────────────┐
verifier ─▶│   Verification   │
            └──────────────────┘
```

## Workflow (per action)
1. **Register issuer** — complianceOfficer → `IssuerRegistry.registerAuditor(Accredited Auditor)`
2. **Create CarbonRecord** — issuer → `RecordRegistry.recordEmissionReport(id, hash, cid, owner, metaURI)` → emits `EmissionReportRecorded`
3. **Verify** — verifier → `Verification.verifyEmissionReport(id, candidateHash)` → `(valid, status, owner, issuer)`
4. **Transfer** — owner → `AuditTrail.transferFacility(id, newOwner)` → emits `FacilityTransferred`
5. **Revoke / update** — issuer/complianceOfficer → `AuditTrail.revoke|amendReport(...)`

## On-chain vs off-chain
| On-chain (lean, permanent) | Off-chain (large, private) |
|----------------------------|----------------------------|
| `keccak256(artifact)` hash | the CarbonRecord file itself (IPFS) |
| IPFS CID + metadataURI     | the human-readable record.json |
| issuer/owner addresses     | any PII (never on-chain) |
| `issuedAt`, `status`, events | |

## Why blockchain here (and where a DB is fine)
- **Blockchain wins:** tamper-evidence, no single trusted server, public verifiability, issuer can revoke.
- **DB still better for:** search/discovery by name, private lookups, high-frequency mutable data.
> Fill this in with your scenario's concrete argument — it's worth 10 pts (Problem definition).
