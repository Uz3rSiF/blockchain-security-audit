// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// تعليمي فقط: ضعيف عمدًا. لا يُنشر على شبكة حقيقية.
contract BadToken {
    mapping(address => uint256) public balanceOf;

    function mint(address to, uint256 amount) public {
        balanceOf[to] += amount;
    }
}

contract FixedToken {
    address public owner;
    mapping(address => uint256) public balanceOf;

    constructor() { owner = msg.sender; }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        balanceOf[to] += amount;
    }
}
