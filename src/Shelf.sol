// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Shelf {
    uint256[] public list;   // أول متغير، يعني slot 0

    function push(uint256 v) external {
        list.push(v);
    }

    function pop() external {
        list.pop();
    }
}
