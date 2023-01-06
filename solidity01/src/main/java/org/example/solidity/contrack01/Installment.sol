// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Installment {
    // 3회이상 적금 후 인출시 적금 총액을 돌려받기
    address owner;
    uint[] account;
    uint256 count;
    uint256 money;
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender==owner,"only owner");
        require(msg.value>0,"Input Ether");
        _;
        count++;
    }

    modifier OwnerWithdraw(){
        require(msg.sender==owner,"only owner");
        require(count>=3,"More installment require");
        _;
        count=0;
    }
    function howMuch() internal {
        money = msg.value;
    }
    function installment() public onlyOwner() payable{
        howMuch();
        account.push(money);
    }
    function withdraw() public OwnerWithdraw() payable returns(bool){       
        (bool success,)= payable(msg.sender).call{value:address(this).balance}("");
        require (success,"Send false");
        return success;
    }

    function howMuchMoney() public view returns(uint){
        return address(this).balance;
    }
    function howManyTime() public view returns(uint){
        return count;
    }

}
