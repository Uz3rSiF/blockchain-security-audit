// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// تعليمي فقط: ضعيف عمدًا. لا يُنشر على شبكة حقيقية.
contract GreeterVulnerable {
    string public greeting;
    address public owner;

    constructor(string memory initialGreeting) {
        greeting = initialGreeting;
        owner = msg.sender;
    }

    function setGreeting(string calldata newGreeting) external {
        greeting = newGreeting;
    }
}
