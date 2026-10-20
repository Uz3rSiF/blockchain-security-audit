// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {RequireBox, CustomBox} from "../src/ErrorsCompare.sol";

contract ErrorsCompareTest is Test {
    RequireBox r;
    CustomBox c;
    address attacker = makeAddr("attacker");

    function setUp() public {
        r = new RequireBox();
        c = new CustomBox();
    }

    function test_Require_OwnerSets() public {
        r.setNumber(1);
        assertEq(r.number(), 1);
    }

    function test_Custom_OwnerSets() public {
        c.setNumber(1);
        assertEq(c.number(), 1);
    }

    function test_Require_AttackerReverts() public {
        vm.prank(attacker);
        vm.expectRevert("RequireBox: caller is not the owner");
        r.setNumber(1);
    }

    function test_Custom_AttackerReverts() public {
        vm.prank(attacker);
        vm.expectRevert(CustomBox.NotOwner.selector);
        c.setNumber(1);
    }
}
