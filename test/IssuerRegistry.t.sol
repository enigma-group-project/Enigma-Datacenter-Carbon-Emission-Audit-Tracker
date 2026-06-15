// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {IssuerRegistry} from "../contracts/IssuerRegistry.sol";

/// @notice Slice 1 tests — Issuer Registration.
contract IssuerRegistryTest is Test {
    IssuerRegistry issuers;
    address alice = address(0xA11CE);

    function setUp() public {
        issuers = new IssuerRegistry();
    }

    function test_AdminIsDeployer() public view {
        assertEq(issuers.complianceOfficer(), address(this));
    }

    function test_RegisterAndRevokeIssuer() public {
        issuers.registerAuditor(alice);
        assertTrue(issuers.isAuditor(alice));
        issuers.deregisterAuditor(alice);
        assertFalse(issuers.isAuditor(alice));
    }

    function test_RevertWhen_NonAdminRegisters() public {
        vm.prank(alice);
        vm.expectRevert(IssuerRegistry.NotComplianceOfficer.selector);
        issuers.registerAuditor(alice);
    }

    function test_RevertWhen_RegisterZeroAddress() public {
        vm.expectRevert(IssuerRegistry.ZeroAddress.selector);
        issuers.registerAuditor(address(0));
    }
    // TODO(slice-1): add complianceOfficer-handover test (transferComplianceOfficer).
}
