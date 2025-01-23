//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;
contract Factory{
    ASuperFancySmartContract[] public arrayOfContract;

    function publishing()public{
        ASuperFancySmartContract a=new  ASuperFancySmartContract();
        a.doesSuperFancyStuff();
        arrayOfContract.push(a);
    }
    function checkingOwner(uint _number) public view returns(address){
        return arrayOfContract[_number].owner();
    }
}

contract ASuperFancySmartContract{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    function doesSuperFancyStuff()public {
        //does whatever needed
}
}