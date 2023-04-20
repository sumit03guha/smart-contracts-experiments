// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "contracts/Counter.sol";

contract CounterTest is Test {
	Counter public counter;

	function setUp() public {
		counter = new Counter();
	}

	function testLoop1() public {
		counter.loop1();
		assertEq(counter.number(), 10);
	}

	function testLoop2() public {
		counter.loop2();
		assertEq(counter.number(), 10);
	}

	function testSetExternal(uint256 num) public {
		counter.setExternal(num);
		assertEq(counter.number(), num);
	}

	function testSetPublic(uint256 num) public {
		counter.setPublic(num);
		assertEq(counter.number(), num);
	}
}
