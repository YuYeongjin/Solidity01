// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract pr1 {
    
    address payable myAcount;

    function money(address _address) public payable returns(bool){
        myAcount = payable(_address);
        (bool send,) = myAcount.transfer(msg.value);
        return send;
    }

}
contract Ex9_2 {

    constructor() payable {}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}
