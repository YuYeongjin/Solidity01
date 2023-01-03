// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract randomGame {
    address public owner=msg.sender;

    event PaidAddress(address indexed sender, uint256 payment);
    event WinnerAddress(address indexed winner);

    modifier onlyOwner() {
        require(msg.sender==owner, "caller is not the owner");
        _;
    }



}
