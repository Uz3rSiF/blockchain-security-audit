// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Registry {
    uint256 public total;                         // slot 0
    mapping(address => uint256) public balances;  // slot 1
    uint256[] public list;                        // slot 2

    function setBalance(address a, uint256 v) external {
        balances[a] = v;
        total += v;
    }

    function push(uint256 v) external {
        list.push(v);
    }
}
