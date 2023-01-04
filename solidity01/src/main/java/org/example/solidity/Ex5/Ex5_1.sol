// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Ex5_1{
    mapping(address=>uint) public balances;

    function addMapping(address _key, uint _amount) public {
        balances[_key] = _amount;
    }
    function getMapping(address _key) public view returns(uint){
        return balances[_key];
    }
    function deleteMapping1(address _key) public {
        delete(balances[_key]);
    }
    function deleteMapping2(address _key) public{
        balances[_key] =0;
    }

    string[5] public array = ["apple","banana","coconut"];
    function addArray1(uint _val,string memory _value) public {
        array[_val] = _value;
        array[_val] = _value;
    }



}