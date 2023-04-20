// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Counter {
	uint256 public number;

	// external
	function setExternal(uint256 _number) external {
		number = _number;
	}

	// public
	function setPublic(uint256 _number) public {
		number = _number;
	}

	// inrement via i++
	function loop1() public {
		for (uint256 i; i < 10; i++) {
			number++;
		}
	}

	// inrement via ++i
	function loop2() public {
		for (uint256 i; i < 10; ++i) {
			number++;
		}
	}
}
