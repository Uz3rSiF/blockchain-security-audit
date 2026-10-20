// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract OwnedBox {
    address public owner;
    uint256 public number;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setNumber(uint256 n) public onlyOwner {
        number = n;
    }
}
