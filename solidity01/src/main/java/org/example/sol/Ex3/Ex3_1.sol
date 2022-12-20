pragma solidity ^0.8.0;

contract Ex3_1 {
    uint public a = 3;
    function myFun() public {
        a=5;
    }
    function myFun(uint b) public{
        a=b;
    }
}
