// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {BadToken, FixedToken} from "../src/BadToken.sol";

contract BadTokenTest is Test {
    BadToken bad;
    FixedToken good;
    address attacker = makeAddr("attacker");

    function setUp() public {
        bad = new BadToken();
        good = new FixedToken();
    }

    function test_Vulnerable_AttackerMintsToSelf() public {
        vm.prank(attacker);
        bad.mint(attacker, 1000);
        assertEq(bad.balanceOf(attacker), 1000);
    }

    function test_Fixed_AttackerCannotMint() public {
        vm.prank(attacker);
        vm.expectRevert("not owner");
        good.mint(attacker, 1000);
    }

    function test_Fixed_OwnerCanMint() public {
        good.mint(address(this), 5);
        assertEq(good.balanceOf(address(this)), 5);
    }
}
