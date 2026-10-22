// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// تعليمي فقط: فيه خطأ مقصود
contract Accounts {
    struct Account {
        uint256 balance;
        bool frozen;
    }

    mapping(address => Account) public accounts;

    function deposit(address a, uint256 v) external {
        accounts[a].balance += v;
    }

    function zeroWithMemory(address a) external {
        Account memory acc = accounts[a];
        acc.balance = 0;
    }

    function zeroWithStorage(address a) external {
        Account storage acc = accounts[a];
        acc.balance = 0;
    }
}
