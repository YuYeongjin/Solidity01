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
            currentMoney();
        } else {
            createMoney(money);
        }
        return getMapping();
    }
    function createMoney(uint money) internal{
        coin = money;
        playerCoin[msg.sender] = coin*1/2;
    }
    function currentMoney() internal{
        playerCoin[msg.sender] = playerCoin[msg.sender]*1/2;
    }
    function getMapping() public view returns(uint){
        return playerCoin[msg.sender];
    }
}