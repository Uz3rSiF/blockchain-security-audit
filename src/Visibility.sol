// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Visibility {
    function pub() public pure returns (uint256) { return 1; }
    function ext() external pure returns (uint256) { return 2; }
    function inner() internal pure returns (uint256) { return 3; }
    function priv() private pure returns (uint256) { return 4; }

    function sum() public pure returns (uint256) {
        return inner() + priv();
    }
}
