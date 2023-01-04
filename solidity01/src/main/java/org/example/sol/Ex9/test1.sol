// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract pickGame {
    address owner;
    uint256 inputEth=msg.value;
    constructor() public{
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"Create only owner");
        _;
    }

    uint256[5][5] pickGameBoard;

    

}
