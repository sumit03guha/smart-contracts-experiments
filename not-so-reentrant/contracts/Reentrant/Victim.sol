// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

// import "hardhat/console.sol";

contract Victim {
	mapping(address => uint256) public balanceOf;

	function deposit() external payable {
		balanceOf[msg.sender] += msg.value;
	}

	function withdraw(uint256 value) external {
		// console.log("withdrawing");

		require(value <= balanceOf[msg.sender], "Insufficient balance");

		(bool success, ) = msg.sender.call{ value: value }("");
		require(success, "Transfer failed");

		// console.log("balance", balanceOf[msg.sender]);

		balanceOf[msg.sender] -= value;

		// console.log("balance after", balanceOf[msg.sender]);
	}
}
