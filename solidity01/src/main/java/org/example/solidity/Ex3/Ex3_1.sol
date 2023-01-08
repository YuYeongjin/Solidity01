// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

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
    function myFun3() public pure returns(uint age, uint weight){
        age=28;
        weight=80;
    }
    function myFunction(string calldata str) external pure returns(string memory){
        return str;
    }

    uint public pub = 1;
    uint private pri =2;
    uint internal inter = 3;
    // uint external ext = 4;

    function funPub() public view returns(uint,uint,uint){
        return (pub,pri,inter);
    }
    function funPriv() private view returns(uint,uint,uint){
        return (pub,pri,inter);
    }
    function funInter() internal view returns(uint,uint,uint){
        return (pub,pri,inter);
    }
    function funExter() external view returns(uint,uint,uint){
        return (pub,pri,inter);
    }
    function funExt() external pure returns(uint){
        return 2;
    }
    function outputExt() public view returns(uint){
        return this.funExt();
    }



}
