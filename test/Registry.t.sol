// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Registry} from "../src/Registry.sol";

contract RegistryTest is Test {
    Registry reg;

    function setUp() public {
        reg = new Registry();
    }

    function test_MappingSlot() public {
        address user = makeAddr("user");
        reg.setBalance(user, 777);

        bytes32 slot = keccak256(abi.encode(user, uint256(1)));
        bytes32 raw = vm.load(address(reg), slot);

        assertEq(uint256(raw), 777);
    }

    function test_ArrayLengthAndElements() public {
        reg.push(11);
        reg.push(22);

        assertEq(uint256(vm.load(address(reg), bytes32(uint256(2)))), 2);

        bytes32 base = keccak256(abi.encode(uint256(2)));
        assertEq(uint256(vm.load(address(reg), base)), 11);
        assertEq(uint256(vm.load(address(reg), bytes32(uint256(base) + 1))), 22);
    }
}
