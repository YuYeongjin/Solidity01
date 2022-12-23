pragma solidity >=0.7.0 < 0.9.0;

/*
 1. 1 이더만 내야함
 2. 중복해서 참여 불가 (적립금을 받으면 초기화)
 3. 관리자만 적립된 이더 볼 수 있음
 4. n 배수 번째 사람에게만 적립된 이더를 지급함.
*/

contract moneyBox {
    event whoPaid(address indexed sender, uint256 payment);

    address owners;

    mapping (uint256 => mapping(address => bool)) paidMemberList;
    uint256 round = 1;

    constructor(){
        owner = msg.sender;
    }
    receive() external payable{
       require(msg.value == 1 ether, "Must be 1 ether.");

    }

}
