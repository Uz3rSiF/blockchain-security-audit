// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mutability {
    uint256 public x = 10;

    function readX() public view returns (uint256) { return x; }

    function add(uint256 a, uint256 b) public pure returns (uint256) { return a + b; }

    function setX(uint256 n) public { x = n; }

    function deposit() public payable {}
}
