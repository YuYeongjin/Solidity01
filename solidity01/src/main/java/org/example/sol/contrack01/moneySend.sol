// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract moneySend {
    event howMuch(uint _value);

    function sendMethod(address payable _to) public payable{
        bool sent = _to.send(msg.value);
        require(sent,"Failed to send either");
        emit howMuch(msg.value);
    }

    function transferMethod(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callMethod(address payable _to) public payable{
        (bool sent,) = _to.call{value: msg.value};
        require(sent,"Failed to send either");
        emit howMuch(msg.value);
    }
}
