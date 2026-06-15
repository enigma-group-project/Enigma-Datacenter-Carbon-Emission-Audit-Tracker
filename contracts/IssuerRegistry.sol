// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title IssuerRegistry — Slice 1 (Auditor Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). Behavior is described in docs/issuer-module.md and
///         locked by test/IssuerRegistry.t.sol — run `forge test` until it is green.
contract IssuerRegistry {
    address public complianceOfficer;
    mapping(address => bool) public isAuditor;

    event ComplianceOfficerTransferred(address indexed from, address indexed to);
    event AuditorRegistered(address indexed issuer, address indexed by);
    event AuditorDeregistered(address indexed issuer, address indexed by);

    error NotComplianceOfficer();
    error ZeroAddress();

    modifier onlyComplianceOfficer() {
        if (msg.sender != complianceOfficer) revert NotComplianceOfficer();
        _;
    }

    constructor() {
        complianceOfficer = msg.sender;
        emit ComplianceOfficerTransferred(address(0), msg.sender);
    }

    /// @notice Grant the issuer role. Admin-only; reject zero address; emit AuditorRegistered.
    function registerAuditor(address account) external onlyComplianceOfficer {
        // TODO(member1): if account == address(0) revert ZeroAddress();
        //               isAuditor[account] = true; emit AuditorRegistered(account, msg.sender);
        revert("TODO(member1): implement registerAuditor");
    }

    /// @notice Revoke the issuer role. Admin-only; emit AuditorDeregistered.
    function deregisterAuditor(address account) external onlyComplianceOfficer {
        // TODO(member1): isAuditor[account] = false; emit AuditorDeregistered(account, msg.sender);
        revert("TODO(member1): implement deregisterAuditor");
    }

    /// @notice Transfer the complianceOfficer key. Admin-only; reject zero address; emit ComplianceOfficerTransferred.
    function transferComplianceOfficer(address newAdmin) external onlyComplianceOfficer {
        // TODO(member1): validate newAdmin, emit ComplianceOfficerTransferred(complianceOfficer, newAdmin), then complianceOfficer = newAdmin;
        revert("TODO(member1): implement transferComplianceOfficer");
    }
}
