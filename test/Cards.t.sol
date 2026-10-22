// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Cards} from "../src/Cards.sol";

contract CardsTest is Test {
    Cards cards;

    function setUp() public {
        cards = new Cards();
    }

    function test_StructFieldsInOrder() public {
        cards.set(500, true);

        assertEq(uint256(vm.load(address(cards), bytes32(uint256(0)))), 500);
        assertEq(uint256(vm.load(address(cards), bytes32(uint256(1)))), 1);
    }
}
