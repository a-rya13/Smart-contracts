//SPDX-License-Identifier: MIT
// in this contract i have to get fund from the users
//withdraw funds
//set a minimum funding value in USD
pragma solidity ^0.8.18;

import {PriceConvertor} from "./PriceConvertor.sol";
error NoOwner();
//constant,immutable
contract FundME{
    using PriceConvertor for uint256;

    uint256 public constant minimumUsd=50*1e18;//this is the constant through out the contract
    address[] public funders;
    mapping(address funder=>uint256 amountFunded)public addressToAmountFunded;
    address public immutable owner;
    
    constructor(){
        //automatically called
        //we want withdraw function to be only called by the owner
        owner=msg.sender;
    }
    
    
    
    
    function fund() public payable{
        // msg.value.egtConversionRate();
        //allow users to send USD
        //have a minimum $ sent-$5
        //Setting value > 1ETH
        require(msg.value.getConversionRate()>=minimumUsd, "did not send enough eth");//1e18= 1ETH=100000000000000000000=1*10**18(**POWER)
        funders.push(msg.sender);//keeping a track of list of funders
        addressToAmountFunded[msg.sender]+=msg.value;
    }
    function withdraw()public onlyOwner{
        // require(msg.sender==owner,"must be owner");-modifier comes into play for this line
        //for loop
        //{1,2,3,4}-elements
        //0,1,2,3-indexes
        for(uint256 funderIndex=0;funderIndex<funders.length;funderIndex++){
            address funder=funders[funderIndex];
            addressToAmountFunded[funder]=0;
        }
//reset the array
//withdraw funds
funders=new address[](0);//reseting the funders array with the new keyword
    //three different ways of sending tokens to each other contracts
    //transfer(2300gas, if fails then throws error)
    payable(msg.sender).transfer(address(this).balance);//this keyword refers to the whole contract
    //send(2300 gas, if fails then returns boolean)
    bool sendSuccess=payable(msg.sender).send(address(this).balance);
    require(sendSuccess,"Send Failed");
    //call(forward all gas or set gas, returns boolean)
    (bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}("");
    require(callSuccess,"call Failed");
    //msg.sender=address
    //payable(msg.sender)=payable address
    }
    modifier onlyOwner(){
        // require(msg.sender==owner,"sender is not owner");
        if(msg.sender!=owner){revert NoOwner();}
        _;//this implements whatever the other code may be but it will be executed after requrire line

    }
    //what happens if someone is sending ethereum and is not calling the fund function

    receive() external payable{
        fund();
    }
    fallback() external payable{
        fund();
    }
}