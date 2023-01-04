// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ownerGame {
   address owner=msg.sender;
   uint256 money=msg.value;
   event whoSend(address add, uint256 money);
   
   modifier onlyOwner(){
       require(owner == msg.sender,"Only owner play game");
       _;
   }
}
