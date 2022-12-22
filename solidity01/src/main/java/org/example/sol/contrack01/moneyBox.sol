pragma solidity >=0.7.0 < 0.9.0;

contract moneyBox {

    /*
     1. 1 이더만 내야함
     2. 중복해서 참여 불가 (적립금을 받으면 초기화)
     3. 관리자만 적립된 이더 볼 수 있음



    */
    event whoPaid(address indexed sender, uint256 payment);

    address owners;

    mapping (uint256 => mapping(address => bool)) paidMemberList;
    uint256 round = 1;

    constructor(){
        owner = msg.sender;

    }

}
