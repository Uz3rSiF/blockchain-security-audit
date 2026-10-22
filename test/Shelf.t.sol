// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Shelf} from "../src/Shelf.sol";

contract ShelfTest is Test {
    Shelf shelf;

    function setUp() public {
        shelf = new Shelf();
    }

    function test_ArrayLayout() public {
        shelf.push(11);
        shelf.push(22);

        // 1) الطول في slot 0
        assertEq(uint256(vm.load(address(shelf), bytes32(uint256(0)))), 2);

        // 2) بداية العناصر = الماكينة(0)
        bytes32 start = keccak256(abi.encode(uint256(0)));
        assertEq(uint256(vm.load(address(shelf), start)), 11);

        // 3) العنصر التاني في start + 1
        assertEq(uint256(vm.load(address(shelf), bytes32(uint256(start) + 1))), 22);
    }
    
    function test_PopClearsElement() public {
        shelf.push(11);
        shelf.push(22);
        shelf.pop();

        // الطول بقى 1
        assertEq(uint256(vm.load(address(shelf), bytes32(uint256(0)))), 1);

        // الغرفة اللي كان فيها 22 بقت فاضية
        bytes32 start = keccak256(abi.encode(uint256(0)));
        assertEq(uint256(vm.load(address(shelf), bytes32(uint256(start) + 1))), 0);
    }
}
