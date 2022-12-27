// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
 1. 참가자가 돈을 지불하면
 2. 1/2배를 돌려주는 돈복사프로그램
 3. 을 만들기 전 함수로만....
*/

contract moneygame {
    address player;
    uint coin;

    mapping (address => uint) playerCoin;

    constructor(){
        player = msg.sender;
    }
    function haveMoney(uint money) public returns(uint){
        if(playerCoin[msg.sender] !=0){
            return currentMoney();
        } else {
            return createMoney(money);
        }
    }
    function createMoney(uint money) internal returns(uint){
        coin = money;
        playerCoin[msg.sender] = coin*1/2;
        return getMapping();
    }
    function currentMoney() internal returns(uint){
        playerCoin[msg.sender] = playerCoin[msg.sender]*1/2;
        return getMapping();
    }

    function getMapping() internal view returns(uint){
        return playerCoin[msg.sender];
    }
}
