// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Accounts} from "../src/Accounts.sol";

contract AccountsTest is Test {
    Accounts ledger;
    address user = makeAddr("user");

    function setUp() public {
        ledger = new Accounts();
    }

    function test_MemoryCopyDoesNotPersist() public {
        ledger.deposit(user, 100);
        ledger.zeroWithMemory(user);
        (uint256 bal, ) = ledger.accounts(user);
        assertEq(bal, 100);
    }

    function test_StoragePointerPersists() public {
        ledger.deposit(user, 100);
        ledger.zeroWithStorage(user);
        (uint256 bal, ) = ledger.accounts(user);
        assertEq(bal, 0);
    }
}
