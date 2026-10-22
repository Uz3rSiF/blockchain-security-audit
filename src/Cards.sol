// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Cards {
    struct Card {
        uint256 balance;
        bool frozen;
    }

    Card public card;   // أول متغير، يعني يبدأ من slot 0

    function set(uint256 b, bool f) external {
        card.balance = b;
        card.frozen = f;
    }
}
