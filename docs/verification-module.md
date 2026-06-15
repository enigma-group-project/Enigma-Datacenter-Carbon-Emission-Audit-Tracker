# Slice 3 — Verification (`Verification.sol`)

> Owner: member3 · Branch: `feature/verification-module` · Scenario: Data-center carbon-emission audit: accredited auditors anchor tamper-evident emission-evidence hashes so a regulator can verify a data center's reported carbon footprint without trusting a central database.

## What it does
The zero-gas read path a Regulator/Registry uses to confirm a CarbonRecord is authentic, active, and who owns it.

## Functions
- `verifyEmissionReport(id, candidateHash)` → `(valid, status, owner, issuer)`
- `verifyEmissionReportHash` · `statusOf` · `ownerOf`

## Demo script
1. Issue a CarbonRecord (Slice 2).
2. Re-hash the same artifact in the Verification page → ✅ VALID.
3. Revoke it (Slice 4) → re-verify → status `Revoked`, valid=false.

## Tests (`test/Verification.t.sol`)
- hash match · wrong hash fails · verifyEmissionReport active.

## TODO checklist
- [ ] `TODO(slice-3)` assert valid=false after revoke
- [ ] in-browser IPFS fetch + re-hash
