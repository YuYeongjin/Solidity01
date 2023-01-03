// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract pr1 {
    
    address myAcount;
    constructor() payable {}
    function money(address _address) public payable returns(bool){
        myAcount = _address;
        (bool send) = payable(myAcount).send(msg.value);
        return send;
    }

    function getMoney() public view returns(uint){
        return myAcount.balance;
    }
}
contract Ex9_2 {

    constructor() payable {}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}
