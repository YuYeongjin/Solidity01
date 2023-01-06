// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Installment {
    // 3회 적금 시 적금 총액을 돌려받기
    address owner;
    uint[] account;
    uint count;
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender==owner,"only owner");
        _;
    }

    function installment() public onlyOwner() {
        account.push(msg.value);
    }

}
