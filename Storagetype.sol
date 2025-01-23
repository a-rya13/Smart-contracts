//SPDX-License-Identifier:MIT

pragma solidity >0.8.15;

contract Storagetype{
    //storage is done in 4 ways
    //1.storage=>stored on the blockchain(it will stay forver)
    uint256 coins=0;

    //2.Memory=> the variables are stored have a lifetime
    function addNames(string memory names) public
    {
        //lifetime started
        //do something
        //life ended
    }
    //3.Stack=> All variables declared in a function are stored in a fixed size stack
    function add() public{
        uint256 a;
        string b;
    }
    //4. Calldata=> Similar to memory, this variables have a lifetime but are immutable
    function addNames(string calldata names) public
    {
        //lifetime started
        //do something
        //life ended
    }
}