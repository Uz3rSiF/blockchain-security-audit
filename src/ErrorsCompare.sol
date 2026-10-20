// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract RequireBox {
    address public owner;
    uint256 public number;

    constructor() { owner = msg.sender; }

    function setNumber(uint256 n) public {
        require(msg.sender == owner, "RequireBox: caller is not the owner");
        number = n;
    }
}

contract CustomBox {
    error NotOwner();

    address public owner;
    uint256 public number;

    constructor() { owner = msg.sender; }

    function setNumber(uint256 n) public {
        if (msg.sender != owner) revert NotOwner();
        number = n;
    }
}
