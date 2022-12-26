// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract simplePublicAuction {
    // 변수선언
    address public beneficiary;  // 수혜자
    uint public actionEnd;

    // 경매 현재 상황 변수
    address public highestBidder;
    uint public highestBid;

    // 이전 가격 목록들
    mapping(address =>uint) pendingReturns;

    // 경매 최종 변수
    bool ended;

    // 변경에 발생하는 이벤트

    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // 수혜자의 주소를 포함하는 간단한 경매 함수 제작
    function SimpleAuction(
        uint _biddingTime,
        address _beneficiary
    ) public {
        beneficiary=_beneficiary;
        actionEnd = now + _biddingTime;
    }
    // 경매에 대한 가격 제시와 값은 이 트랜젝션으로 보내짐, 값은 이기지 못한 경우 반환
    function bid() public payable{
        // payable은 이더를 지급하는 것이 가능하도록 하기위함.

        // 경매 종료시 반환
        require(now <= actionEnd);

        // 만약 제시한 값이 높지않다면 돈을 돌려줌
        require(msg.value >highestBid);

        if(highestBid !=0){
            // highestBidder.send(highestBid)는 보안상의 문제가 있을 수 있음
            // 받는 사람이 그들의 돈을 그들 스스로 출금하도록 하는 것이 안전함
            pendingReturns[highestBidder] +=highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    // 가장 비싼 제시금액은 출금
    function withdraw() public returns (bool){
        uint amount = pendingReturns[msg.sender];
        if(amount>0){
            // 이 함수는 send 이전에 호출의 일부로서 재사용성이 있기에 0으로 만듦
            pendingReturns[msg.sender] =0;
            if (!msg.sender.send(amount)){
                pendingReturns[msg.sender]=amount;
                return false;
            }
        }
        return true;
    }

    // 경매 종료 및 최고 금액을 수혜자에게 송금
    function auctionEnd() public {
        // 계약들과 상호작용하는 함수의 구조
        // 1. 조건 확인
        // 2. 동작 수행
        // 3. 상호 작용

        // 1. 조건
        require(now >= actionEnd);
        require(!ended);

        // 2. 동작 수행
        ended = true;
        emit AuctionEnded(highestBidder,highestBid);

        // 3. 상호 작용
        beneficiary.transfer(highestBid);
    }


}
