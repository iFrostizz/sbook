// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {SBook} from "src/SBook.sol";

contract SBookTest is Test {
    using SBook for *;

    function setUp() public {}

    function testStore() public {
	address toStore = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
	SBook.store_addr("WETH9", "mainnet", toStore, true);
	address addr = SBook.get_addr("WETH9", "mainnet");

	assertEq(toStore, addr);
    }
}
