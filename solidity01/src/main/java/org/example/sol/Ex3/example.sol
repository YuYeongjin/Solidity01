pragma solidity ^0.8.0;

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
