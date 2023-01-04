// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract pickGame {
    address owner;
    uint256 inputEth=msg.value;
    uint256[5][5] pickGameBoard;
    bool[5][5] pickGameBoardCheck;
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender==owner,"Create only owner");
        _;
    }
    modifier boardClear(){
        uint cnt=0;
        for(uint i=0;i<5;i++){
            for(uint j=0;j<5;j++){
                if(pickGameBoardCheck[i][j]){
                    cnt++;
                }
            }
        }
        require(cnt>=24,"Doesn't Clear Board");
        _;
    }

    function CreateBoard() public onlyOwner() boardClear(){
        
    }

}
