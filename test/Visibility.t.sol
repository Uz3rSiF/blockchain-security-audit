// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Visibility} from "../src/Visibility.sol";

contract VisibilityTest is Test {
    Visibility v;

    function setUp() public {
        v = new Visibility();
    }

    function test_PublicAndExternal() public view {
        assertEq(v.pub(), 1);
        assertEq(v.ext(), 2);
    }

    function test_SumUsesInternalAndPrivate() public view {
        assertEq(v.sum(), 7);
    }
}
