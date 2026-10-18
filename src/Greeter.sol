// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Greeter {
    string public greeting;
    address public owner;

    constructor(string memory initialGreeting) {
        greeting = initialGreeting;
        owner = msg.sender;
    }

    function setGreeting(string calldata newGreeting) external {
        require(msg.sender == owner, "not owner");
        greeting = newGreeting;
    }
}
