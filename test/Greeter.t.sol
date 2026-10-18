// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Greeter} from "../src/Greeter.sol";

contract GreeterTest is Test {
    Greeter public greeter;
    address public attacker = makeAddr("attacker");

    function setUp() public {
        greeter = new Greeter("Hello");
    }

    function test_OwnerIsDeployer() public view {
        assertEq(greeter.owner(), address(this));
    }

    function test_AttackerCannotChangeGreeting() public {
        vm.prank(attacker);
        vm.expectRevert("not owner");
        greeter.setGreeting("hacked");
    }

    function test_OwnerCanChangeGreeting() public {
        greeter.setGreeting("Salam");
        assertEq(greeter.greeting(), "Salam");
    }
}
