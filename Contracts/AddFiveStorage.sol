//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//we have to just add 5 to our favorite number in SimpleStorage
// here comes inheritance into existence
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    //adding new things to SimpleStorage
    // function sayHello() public pure returns(string memory){
        // return "Hello";}
    //next thing
   //+ 5
   // overrides
    //virtual override
    function store(uint256 _newNumber) public override{
myfavoriteNumber= _newNumber+5; //finished adding 5 toh original number
    }
}
