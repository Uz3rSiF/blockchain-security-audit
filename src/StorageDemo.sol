// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract StorageDemo {
    uint256 public a;
    bool public flag;
    address public owner;
    bytes32 public hash;
    string public name;

    constructor() {
        a = 1;
        flag = true;
        owner = msg.sender;
        hash = keccak256("hello");
        name = "Ethereum";
    }
}
