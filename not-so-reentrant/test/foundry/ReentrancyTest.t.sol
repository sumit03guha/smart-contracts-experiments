// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

pragma abicoder v2;

import "forge-std/Test.sol";
import "contracts/Reentrant/Victim.sol";
import "contracts/Reentrant/Attacker.sol";

contract ReentrancyTest is Test {
	Victim public victimContract;
	Attacker public attackerContract;

	address public alice = vm.addr(0x1);
	address public bob = vm.addr(0x2);
	address public charlie = vm.addr(0x3);
	address public dave = vm.addr(0x4);
	address public attacker = vm.addr(0x6);

	function setUp() public {
		victimContract = new Victim();
		attackerContract = new Attacker(address(victimContract));

		vm.deal(alice, 1 ether);
		vm.deal(bob, 1 ether);
		vm.deal(charlie, 1 ether);
		vm.deal(dave, 1 ether);
		vm.deal(attacker, 1 ether);

		vm.prank(alice);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(alice), 1 ether);

		vm.prank(bob);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(bob), 1 ether);

		vm.prank(charlie);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(charlie), 1 ether);

		vm.prank(dave);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(dave), 1 ether);
	}

	function testAttack() public {
		vm.prank(attacker);
		attackerContract.attack{ value: 1 ether }();
		assertEq(address(attackerContract).balance, 5 ether);
	}
}
