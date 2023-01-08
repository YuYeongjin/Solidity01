// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract quiz1{
    // 1번 . 5를 반환하는 함수 > returnValue5 

    function returnValue5() public pure returns(uint){
        return 5;
    }

    /* 2번 . getString 
        가시성지정자 public
        매개변수 string 자료형
        return string, 받은값 즉시 return
    */
    function getString(string calldata str) public pure returns(string memory){
        
        return str;
    } 
    /*
        3번 . doubledNum
        가시성 지정자 public
        uint return
        변수 num에 대해 함수 내부에서 num값의 2배를 대입 후 return
    */
    function doubledNum(uint num) public pure returns(uint){
        return num*2;

    }

    function ifFun(uint number) public pure returns(uint){


        if(number > 5){
            return 5;
        }

        return 0;

    }
    function whileFun(uint num) public {
        for (uint i = 0 ; i < 10; i++){
            if( i < 3){

            }
            if(i==7){
                break;
            }
        }
    }
}