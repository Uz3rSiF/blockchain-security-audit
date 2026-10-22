// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {Hotel} from "../src/Hotel.sol";

contract HotelTest is Test {
    Hotel hotel;

    function setUp() public {
        hotel = new Hotel();
    }

    function test_WrittenAndUnwritten() public {
        address ali = makeAddr("ali");
        address sara = makeAddr("sara");

        hotel.setBalance(ali, 777);

        assertEq(hotel.balances(ali), 777);
        assertEq(hotel.balances(sara), 0);
    }
    
    function test_FindTheRoomByHand() public {
        address ali = makeAddr("ali");
        hotel.setBalance(ali, 777);

        bytes32 room = keccak256(abi.encode(ali, uint256(0)));
        bytes32 raw = vm.load(address(hotel), room);

        assertEq(uint256(raw), 777);
    }
}
