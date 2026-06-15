# Slice 1 — Issuer Registration (`IssuerRegistry.sol`)

> Owner: member1 · Branch: `feature/issuer-module` · Scenario: Data-center carbon-emission audit: accredited auditors anchor tamper-evident emission-evidence hashes so a regulator can verify a data center's reported carbon footprint without trusting a central database.

## What it does
The single source of truth for **who may issue a CarbonRecord** and who the complianceOfficer is.

## Functions
- `registerAuditor(address)` — complianceOfficer grants the issuer role to a Accredited Auditor.
- `deregisterAuditor(address)` — complianceOfficer revokes it.
- `transferComplianceOfficer(address)` — hand the complianceOfficer key to a multisig.
- `isAuditor(address)` / `complianceOfficer()` — reads used by the other three slices.

## Tests (`test/IssuerRegistry.t.sol`)
- complianceOfficer is the deployer · register+revoke · non-complianceOfficer reverts · zero-address reverts.

## TODO checklist
- [ ] `TODO(slice-1)` two-step complianceOfficer handover
- [ ] event-driven issuer list in the frontend
- [ ] Extension: swap to OpenZeppelin `AccessControl`, note gas delta

## Demo evidence
Screenshot: registering a Accredited Auditor and the `AuditorRegistered` event in the trace.
