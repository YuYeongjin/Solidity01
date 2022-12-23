// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

/*
 1. 사람이 2명일 경우
 2. 서로의 1 이더를 교환해보자.
*/


contract tradeGame {

    mapping(address => uint) userData;


    function checkValue() public view returns(uint256){
        require(owner==msg.sender,"Only Owner can check the value");
        return address(this).balance;
    }

}
