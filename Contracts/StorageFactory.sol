//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
 //uint256 public favoriteNumber
//  type visibility name

SimpleStorage[] public listOfSimpleStorageContracts; //this line creates a list and every value is stored and you can call indexwise
//SimpleStorage referring to the contract
//simpleStorage refrring to the variable
//(SimpleStorage public simpleStorage)overriding in simpleStorage everytime you are calling the contract

    function creatSimpleStorageContract() public{
SimpleStorage newSimpleStorageContract= new SimpleStorage(); //create new simplestorage contracts from storage factory contracts
listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        //address
        //ABI/application binary interface-tells how one contract will interact with another contract
       SimpleStorage mySimpleStorage= listOfSimpleStorageContracts[_simpleStorageIndex];
       mySimpleStorage.store(_newSimpleStorageNumber); 
        
    }
    function sfGet(uint256 _simpleStorageIndex)public view returns(uint256){
        SimpleStorage mySimpleStorage= listOfSimpleStorageContracts[_simpleStorageIndex]; //just creating an array
        return mySimpleStorage.retrieve(); //returning the array and can be done directly
    }
}
