// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Mutability} from "../src/Mutability.sol";

contract MutabilityTest is Test {
    Mutability m;

    function setUp() public {
        m = new Mutability();
    }

    function test_ReadAndAdd() public view {
        assertEq(m.readX(), 10);
        assertEq(m.add(2, 3), 5);
    }

    function test_SetX() public {
        m.setX(99);
        assertEq(m.x(), 99);
    }

    function test_DepositAcceptsEther() public {
        vm.deal(address(this), 1 ether);
        m.deposit{value: 1 ether}();
        assertEq(address(m).balance, 1 ether);
    }
}
