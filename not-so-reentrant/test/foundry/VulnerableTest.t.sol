// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

pragma abicoder v2;

import "forge-std/Test.sol";
import "contracts/Vulnerable/UnsafeVictim.sol";
import "contracts/Vulnerable/SuccessfulAttacker.sol";

contract VulnerableTest is Test {
	UnsafeVictim public victimContract;
	SuccessfulAttacker public attackerContract;

	// Creating signers for the test.
	address public alice = vm.addr(0x1);
	address public bob = vm.addr(0x2);
	address public charlie = vm.addr(0x3);
	address public attacker = vm.addr(0x4);

	event Successful(uint256 amount);

	/**
	 * @notice Setting up the test.
	 * @dev This function is called before each test.
	 * @dev The smart contracts are deployed and the initial states are set.
	 */
	function setUp() public {
		victimContract = new UnsafeVictim();

		vm.prank(attacker);
		attackerContract = new SuccessfulAttacker(address(victimContract));

		// The signers are allocated with 1 ether each.

		vm.deal(alice, 1 ether);
		vm.deal(bob, 1 ether);
		vm.deal(charlie, 1 ether);
		vm.deal(attacker, 1 ether);

		// The signers deposit 1 ether each to the victim contract.

		vm.prank(alice);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(alice), 1 ether);

		vm.prank(bob);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(bob), 1 ether);

		vm.prank(charlie);
		victimContract.deposit{ value: 1 ether }();
		assertEq(victimContract.balanceOf(charlie), 1 ether);
	}

	/**
	 * @notice Testing the attack.
	 * @dev The attacker contract is called to attack the victim contract.
	 * @dev Prior to this attack 3 ethers had been deposited to the victim contract.
	 * @dev The attacker deposits 1 ether to the victim contract.
	 * @dev The attacker should be able to withdraw 4 ethers from the victim contract.
	 * @dev The attack should succeed.
	 * @dev The event log should be emitted with the correct amount.
	 */
	function testAttack() public {
		vm.prank(attacker);

		// Checking the event data
		vm.expectEmit(false, false, false, true);

		emit Successful(4 ether);

		attackerContract.attack{ value: 1 ether }();

		// Checking the attacker balance after the attack
		assertEq(attacker.balance, 4 ether);
	}
}
