//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;
contract MultipleContracts{
    // what is required for calling other smart contracts
    // 1.interface of the other contract
    // 2.address
    address second;
    function setAddress(address _second)public{
        second=_second;
    }
    function calling()public returns(string memory){
        OtherSmartContract b=new OtherSmartContract();//creating a  ne instance
        return b.doingSomething();
    }

}


contract OtherSmartContract{
    function doingSomething()external pure returns(string memory){
        return "Helo fro Other Smart Contract";
    }
}
