pragma solidity >=0.7.0 < 0.9.0;

/*
 1. 1 이더만 내야함
 2. 중복해서 참여 불가 (적립금을 받으면 초기화)
 3. 관리자만 적립된 이더 볼 수 있음
 4. 3 배수 번째 사람에게만 적립된 이더를 지급함.
*/

contract moneyBox {
    event whoPaid(address indexed sender, uint256 payment);

    address owners;

    mapping (uint256 => mapping(address => bool)) paidMemberList;

    mapping(address=>bool) paidMemberList2;

    uint256 round = 1;

    constructor(){
        owner = msg.sender;
    }
    receive() external payable{
        require(msg.value == 1 ether, "Must be 1 ether.");
        require(paidMemberList[round][msg.sender] == false, "Must be a new player in each game.");
        paidMemberList[round][msg.sender]=true;
        emit whoPaid(msg.sender, msg.value);
        if(address (this).balance == 3 ether){
            (bool sent,)= payable(msg.sender).call{value:address(this).balance}("");
            require(sent,"Failed to pay");
            round++;
        }
    }
    function checkRound() public view returns(uint256){
        return round;
    }
    function checkValue() public view returns(uint256){
        require(owner==msg.sender,"Only Onwer can check the value");
        return address(this).balance;
    }

}
