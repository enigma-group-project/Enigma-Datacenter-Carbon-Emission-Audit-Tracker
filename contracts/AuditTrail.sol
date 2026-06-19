// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {IAttestationRegistry} from "./interfaces/IAttestationRegistry.sol";
import {RecordRegistry} from "./RecordRegistry.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
/// @title AuditTrail — Slice 4 (Transfer / Revocation / Amendment / Audit). OZ ReentrancyGuard.  [STUDENT TEMPLATE]
contract AuditTrail is ReentrancyGuard {
    RecordRegistry public immutable registry;
    event FacilityTransferred(bytes32 indexed id, address indexed from, address indexed to, uint64 at);
    event EmissionReportRevoked(bytes32 indexed id, address indexed by, string reason, uint64 at);
    event ReportAmended(bytes32 indexed id, bytes32 newHash, string newCid, uint64 at);
    event AuditCheckpointLogged(bytes32 indexed id, address indexed by, string note, uint64 at);
    error NotOwner(); error NotAuditorOrComplianceOfficer(); error Missing();
    constructor(address recordRegistry) { registry = RecordRegistry(recordRegistry); }
    function transferFacility(bytes32 id, address newOwner) external nonReentrant {
        revert("TODO(member4): implement transferFacility");
    }
    function revokeEmissionReport(bytes32 id, string calldata reason) external nonReentrant {
        revert("TODO(member4): implement revokeEmissionReport");
    }
    function amendReport(bytes32 id, bytes32 newHash, string calldata newCid) external nonReentrant {
        revert("TODO(member4): implement amendReport");
    }
    function logAuditCheckpoint(bytes32 id, string calldata note) external { revert("TODO(member4): implement logAuditCheckpoint"); }
}
