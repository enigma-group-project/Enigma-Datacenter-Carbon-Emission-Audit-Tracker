# Slice 2 — Record Creation (`RecordRegistry.sol`)

> Owner: member2 · Branch: `feature/record-module` · Scenario: Data-center carbon-emission audit: accredited auditors anchor tamper-evident emission-evidence hashes so a regulator can verify a data center's reported carbon footprint without trusting a central database.

## What it does
Issues a CarbonRecord and stores the on-chain proof (hash + CID + owner + status). The only
contract that mutates state; mutations after creation go through the controller (Slice 4).

## Functions
- `recordEmissionReport(id, dataHash, cid, owner, metadataURI)` — `onlyAuditor`, `nonReentrant`.
- `getRecord(id)` / `exists(id)` — views from `IAttestationRegistry`.
- `setController(address)` — complianceOfficer links the AuditTrail once.

## Data representation
See `schemas/record.schema.json` (off-chain) and `schemas/attestation-onchain.schema.json` (on-chain).

## Tests (`test/RecordRegistry.t.sol`)
- issuer can create · non-issuer reverts · duplicate reverts.

## TODO checklist
- [ ] `TODO(slice-2)` event-emission test
- [ ] frontend: validate record.json against the schema before issuing
