pragma solidity ^0.8.0;


// 위임투표
contract VoteGame{
    // 투표자
    struct Voter {
        uint weight; // 대표가 누적됨
        bool voted;  // true 면 투표한 사람
        address delegate; // 투표에 위임된 사람
        uint vote;
    }
    // 제안서
    struct Proposal {
        bytes32 name;
        uint voteCount; // 누적 투표수
    }

    address public chairperson;

    // Voter struct를 저장하는 상태변수
    mapping(address=> Voter) public voters;

    // Proposal struct의 배열
    Proposal[] public proposals;

    // 새로운 투표권 생성
    function VoteGame(bytes32[] proposalNames) public {
        chairperson = msg.sender;
        voters[chairperson].weight=1;

        for (uint i=0; i<proposalNames.length; i++){
            proposals.push(Proposal({
            name: proposalNames[i],
            voteCount: 0
        }));
        }
    }
    // voter에게 이 투표권의 권한을 부여함
    function giveRightToVote(address voter) public {
        require(
            (msg.sender == chairperson) &&
        !voters[voter].voted &&
        (voters[voter].weight==0)
        );
        voters[voter].weight =1;
    }

    // to 로 유권자에게 투표를 위임함
    function delegate(address to) public{
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);

        require(to != msg.sender); // 자체 허용하지않음

        while (voters[to].delegate !=address(0)){
            to = voters[to].delegate;
            require(to!=msg.sender);
        }

        sender.voted = true;
        sender.delegate = to;
        Voter storage delegate_ = voters[to];
        if (delegate_.voted){ // 대표가 이미 투표한 경우
            proposals[delegate_.vote].voteCount +=sender.weight;
        } else{               // 대표가 아직 투표하지 않은 경우
            delegate_.weight+=sender.weight;
        }
    }
    // proposals[proposal].name에 투표하기.
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        sender.voted=true;
        sender.voted=proposal;

        proposals[proposal].voteCount +=sender.weight;
    }
    // 당첨된 제안서를 계산함
    function winningProposal() public view returns(uint winningProposal_){
        uint winningVoteCount =0;
        for (uint i = 0; i<proposals.length;i++){
            if(proposals[i].voteCount > winningVoteCount){
                winningVoteCount=proposals[i].voteCount;
                winningProposal_ = i;
            }
        }
    }
    // 당첨된 제안서의 이름을 리턴
    function winnerName() public view returns (bytes32 winnerName_){
        winnerName_=proposals[winningProposal()].name;
    }

}
