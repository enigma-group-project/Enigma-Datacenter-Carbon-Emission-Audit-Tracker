// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title IAttestationRegistry — shared type surface for the Enigma attestation spine.
/// @notice Scenario: Data-center carbon-emission audit: accredited auditors anchor tamper-evident emission-evidence hashes so a regulator can verify a data center's reported carbon footprint without trusting a central database. (record = CarbonRecord).
/// @dev Every slice imports this so all four members share one vocabulary.
interface IAttestationRegistry {
    enum Status { None, Active, Revoked, Superseded }

    struct Attestation {
        bytes32 dataHash;    // keccak256 of the off-chain CarbonRecord artifact
        string  cid;         // IPFS CID of the artifact
        address issuer;      // who issued it (Accredited Auditor)
        address owner;       // current owner (Data-Center Operator)
        uint64  issuedAt;    // block timestamp at creation
        Status  status;      // lifecycle flag
        string  metadataURI; // ipfs:// pointer to record.json
    }

    event EmissionReportRecorded(bytes32 indexed id, address indexed issuer, address indexed owner, bytes32 dataHash, string cid);
    event OwnerTransferred(bytes32 indexed id, address indexed from, address indexed to);
    event RecordRevoked(bytes32 indexed id, address indexed by);
    event RecordUpdated(bytes32 indexed id, bytes32 newHash, string newCid);

    function getRecord(bytes32 id) external view returns (Attestation memory);
    function exists(bytes32 id) external view returns (bool);
}
