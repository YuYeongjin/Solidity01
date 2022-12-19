// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ex2_2 {
    string a = "Hello";

    function assignment() public returns(string memory){
        a = "Hello Solidity";
        return(a);

    }
}
