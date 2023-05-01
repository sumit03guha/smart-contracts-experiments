// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

contract UnsafeVictim {
	mapping(address => uint256) public balanceOf;

	function deposit() external payable {
		balanceOf[msg.sender] += msg.value;
	}

	/**
	 * @dev This function is vulnerable to reentrancy attack.
	 * @dev The attacker can call this function and then call withdraw() to withdraw the same amount again.
	 * @dev The check-effect-interaction pattern has not been followed to prevent reentrancy attack.
	 * @param value The amount to withdraw.
	 */
	function withdraw(uint256 value) external {
		require(value <= balanceOf[msg.sender], "Insufficient balance");

		(bool success, ) = msg.sender.call{ value: value }("");
		require(success, "Transfer failed");

		balanceOf[msg.sender] -= value;
	}
}
