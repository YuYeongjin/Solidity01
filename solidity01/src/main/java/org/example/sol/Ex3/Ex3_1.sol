pragma solidity ^0.8.0;

contract Ex3_1 {
    uint public a = 3;
    function myFun() public {
        a=5;
    }
    function myFun1(uint b) public{
        a=b;
    }
    function myFun2(uint c, uint d, uint e) public{
        a=c;
        a=d;
        a=e;
    }

}
