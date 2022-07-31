// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {console2} from "forge-std/console2.sol";
import {strings} from "strings/strings.sol";

library SBook {
    using strings for *;

    address constant vm_address = address(bytes20(uint160(uint256(keccak256('hevm cheat code')))));
    Vm constant vm = Vm(vm_address);

    /*function concat_all(string[] memory str) returns (string memory out) {
	string memory out;

	for (uint i; i < str.length; i++) {
	    out = strings.concat(out, str[i]);
	}
    }*/

    function get_addr(string memory name, string memory chain) internal /*returns (address memory) */ {
	/*string[] memory str = new string[](4);
	str[0] = "cbook get --name ";
	str[1] = name;
	str[2] = " --chain ";
	str[3] = chain;

	string[] memory cmd = new string[](1);
	cmd[0] = concat_all(str);*/

       console2.log("get");

	string[] memory cmd = new string[](1);
	cmd[0] = "cbook get --name WETH9 --chain mainnet";

	bytes memory data = vm.ffi(cmd);
	// console2.log(data);
    }
}
