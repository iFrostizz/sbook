// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {SBook} from "src/SBook.sol";

contract SBookTest is Test {
    using SBook for *;

    function setUp() public {}

    function testExample() public {
	SBook.get_addr("WETH9", "mainnet");
    }
}
