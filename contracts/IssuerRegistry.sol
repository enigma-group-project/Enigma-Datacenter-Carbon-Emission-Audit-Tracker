// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
/// @title IssuerRegistry — Slice 1 (Auditor Registration). OZ Ownable: owner = Compliance Officer.  [STUDENT TEMPLATE]
contract IssuerRegistry is Ownable {
    mapping(address => bool) public isAuditor;
    event ComplianceOfficerTransferred(address indexed from, address indexed to);
    event AuditorRegistered(address indexed auditor, address indexed by);
    event AuditorDeregistered(address indexed auditor, address indexed by);
    error NotComplianceOfficer(); error ZeroAddress();
    modifier onlyComplianceOfficer() { if (msg.sender != owner()) revert NotComplianceOfficer(); _; }
    constructor() Ownable(msg.sender) { emit ComplianceOfficerTransferred(address(0), msg.sender); }
    function complianceOfficer() external view returns (address) { return owner(); }
    function registerAuditor(address account) external onlyComplianceOfficer { revert("TODO(member1): implement registerAuditor"); }
    function deregisterAuditor(address account) external onlyComplianceOfficer { revert("TODO(member1): implement deregisterAuditor"); }
    function transferComplianceOfficer(address newAdmin) external onlyComplianceOfficer { revert("TODO(member1): implement transferComplianceOfficer"); }
}
