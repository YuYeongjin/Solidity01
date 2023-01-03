// SPDX-License-Identifier: GPL-3.0
// OpenZeppelin Contracts v4.6.0 ()
pragma solidity >= 0.7.0 < 0.9.0;

import "openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


contract test is ERC721{
    // ERC721 생성자 함수 실행 ERC721(_name, _symbol)

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){

    }

    function _minting(uint _tokenId) public {
        // msg.sender : 토큰 받을 계정 , _tokenId : 토큰의 고유 키 값
        _mint(msg.sender, _tokenId); 
    }

    // function tokenURI(uint _tokenId) public override pure returns(string memory){
    //     return "https://gateway.pinata.cloud/................................";
    // }


}