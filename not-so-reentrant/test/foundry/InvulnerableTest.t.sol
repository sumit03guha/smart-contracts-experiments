// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "contracts/Invulnerable/SafeVictim.sol";
import "contracts/Invulnerable/FailedAttacker.sol";

contract InvulnerableTest is Test {
	SafeVictim public victimContract;
	FailedAttacker public attackerContract;

	// Creating signers for the test.
	address public alice = vm.addr(0x1);
	address public bob = vm.addr(0x2);
	address public charlie = vm.addr(0x3);
	address public attacker = vm.addr(0x4);

	/**
	 * @notice Setting up the test.
	 * @dev This function is called before each test.
	 * @dev The smart contracts are deployed and the initial states are set.
	 */
	function setUp() public {
		victimContract = new SafeVictim();

		vm.prank(attacker);
		attackerContract = new FailedAttacker(address(victimContract));

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
	 * @dev The attack should fail.
	 */
	function testFailAttack() public {
		vm.prank(attacker);
		attackerContract.attack{ value: 1 ether }();
	}
}
