// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Hotel {
    mapping(address => uint256) public balances;

    function setBalance(address a, uint256 v) external {
        balances[a] = v;
    }
}
