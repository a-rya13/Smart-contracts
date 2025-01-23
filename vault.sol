//SPDX-License-Identifier:MIT

pragma solidity >=0.8.4;
contract Vault{
    address public owner;

    struct Locker{
        uint256 value;
        uint256 time_locked;
    }
    uint counter=0;
    mapping(uint=>Locker) Vaultt;

    //modifier for security purpose for accessing vaultt
    modifier onlyOwner(){
        require(msg.sender==owner,"Can't touch this!");
        _;
    }
    //constructor
    constructor() {
        owner = msg.sender; 
    }
    // functions

    function depost(uint256 _time)public payable onlyOwner{
      counter+=1;
      Vaultt[counter].time_locked=_time;
      Vaultt[counter].value=msg.value;

    }
    function withdraw(uint _lockerNumber)public onlyOwner{
        require(block.timestamp>=Vaultt[_lockerNumber].time_locked,"Comeback Later");
        payable(owner).transfer(Vaultt[_lockerNumber].value);
    }

}