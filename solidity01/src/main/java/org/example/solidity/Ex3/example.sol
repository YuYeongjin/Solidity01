// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// import  "filename";
contract example {

    mapping(address => uint) userData;

    function set(uint x) public{
        userData[msg.sender] = x;
    }
    function get() view returns (uint){
        return userData[msg.sender];
    }
    function getUserData(address user) public view returns(uint){
        return userData[user];
    }

}
