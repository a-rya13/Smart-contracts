//SPDX-License-Identifier:MIT

pragma solidity>=0.8.4;

contract Bank{
    struct Account{
        address owner;
        uint balance;
        uint256 accountCreatedTime;
    }
    mapping(address=>Account) public LaxmiChitFund;
     
     event balanceAdded(address owner, uint256 balance,uint256 timestamp);
     event WithdrawDone(address owner, uint256 balance, uint256 timestamp);

    modifier minimum(){
        require (msg.value >=1 ether,"not enough balance");
        _;
    }
     //account creation
     function accountCreated()public payable{
        LaxmiChitFund[msg.sender].owner=msg.sender;
        LaxmiChitFund[msg.sender].balance=msg.value;
        LaxmiChitFund[msg.sender].accountCreatedTime=block.timestamp;
        emit balanceAdded(msg.sender,msg.value,block.timestamp);
     }

     //depost function
     function deposit()public payable minimum{
        LaxmiChitFund[msg.sender].balance += msg.value;
        emit balanceAdded(msg.sender,msg.value,block.timestamp);
     }   
    //Withdraw function 
     function withdraw()public payable{
        //address.transfer(amount to transfer)
         payable(msg.sender).transfer(LaxmiChitFund[msg.sender].balance);
         emit WithdrawDone(msg.sender, msg.value, block.timestamp);
        
     }
}