// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {console2} from "forge-std/console2.sol";
import {strings} from "strings/strings.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

library SBook {
    using strings for *;
    using Strings for *;

    address constant vm_address = address(bytes20(uint160(uint256(keccak256('hevm cheat code')))));
    Vm constant vm = Vm(vm_address);

    function concat_all(string[] memory str) internal pure returns (string memory) {
	string memory out;

	for (uint i; i < str.length; i++) {
	    out = out.toSlice().concat(str[i].toSlice());
	}

	return string(out);
    }

    function store_addr(string memory name, string memory chain, address addr, bool force) internal {
	if (force) {
	    _store_force(name, chain, addr);
	} else {
	    _store(name, chain, addr);
	}
    }

    function _store(string memory name, string memory chain, address addr) private {
	string[] memory cmd = new string[](8);
	cmd[0] = "cbook";
	cmd[1] = "store";
	cmd[2] = "--name";
	cmd[3] = name;
	cmd[4] = "--chain";
	cmd[5] = chain;
	cmd[6] = "--address";
	cmd[7] = Strings.toHexString(addr);

	vm.ffi(cmd);
    }
    
    function _store_force(string memory name, string memory chain, address addr) private {
	string[] memory cmd = new string[](9);
	cmd[0] = "cbook";
	cmd[1] = "store";
	cmd[2] = "--name";
	cmd[3] = name;
	cmd[4] = "--chain";
	cmd[5] = chain;
	cmd[6] = "--address";
	cmd[7] = Strings.toHexString(addr);
	cmd[8] = "--force";

	vm.ffi(cmd);
    }

    function get_addr(string memory name, string memory chain) internal returns (address) {
	string[] memory cmd = new string[](7);
	cmd[0] = "cbook";
	cmd[1] = "get";
	cmd[2] = "--name";
	cmd[3] = name;
	cmd[4] = "--chain";
	cmd[5] = chain;
	cmd[6] = "--address";

	bytes memory data = vm.ffi(cmd);
	address addr = bytesToAddress(data);

	return addr;
    }

    function bytesToAddress(bytes memory data) internal pure returns (address addr) {
	assembly {
	    addr := mload(add(data, 0x14))
	}
    }
}
