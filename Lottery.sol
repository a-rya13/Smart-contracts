//SPDX-License-Identifier:MIT

pragma solidity 0.8.18;

contract Lottery{
    address public manager;
    address payable[] public participants; //array created because there are three or more participants
    
    constructor()
    {
        manager=msg.sender; //control of the contract+global variable
    }
    //receive can only be used once in the contract and always declared as external and payable.
    receive() external payable
    {
        require(msg.value==0.01 ether);
        participants.push(payable(msg.sender));
    }
    function getBalance() public view returns(uint)
    {
        require(msg.sender==manager);
        return address(this).balance;
    }
    function random() public view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }
    function selectWinner() public 
    {
        require(msg.sender==manager);
        require(participants.length>=3);  //no of participants should be 3
        uint r=random(); //storing random value in r
        address payable winner;
        uint index=r % participants.length; //random variable will keep on giving remainder and at that index position the winner will be declared.
        winner=participants[index];
        // return winner;
        winner.transfer(getBalance());
        participants=new address payable[](0); //reset the dynamic array
    }
}