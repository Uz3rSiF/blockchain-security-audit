// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {OwnedBox} from "../src/OwnedBox.sol";

contract OwnedBoxTest is Test {
    OwnedBox box;
    address attacker = makeAddr("attacker");

    function setUp() public {
        box = new OwnedBox();
    }

    function test_OwnerCanSet() public {
        box.setNumber(5);
        assertEq(box.number(), 5);
    }

    function test_AttackerCannotSet() public {
        vm.prank(attacker);
        vm.expectRevert("not owner");
        box.setNumber(5);
    }
}
