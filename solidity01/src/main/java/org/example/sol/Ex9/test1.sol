// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ownerGame {
   address owner;
   uint money=msg.value;
   constructor() public{
       owner=msg.sender;
   }
   modifier onlyOwner(){
       require(owner == msg.sender,"Only owner play game");
       _;
   }
      
   function play() public onlyOwner() returns (bool){
       require(money==10*15, "Need 0.1ether");
       (bool sent )= payable(msg.sender).send(money);
       return true;
   }
}
