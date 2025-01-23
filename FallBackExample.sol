//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;
contract FallBackExample{
    uint256 public result;

//function keyword is not used because receive is inself special
    receive()external payable{
     result=1;
    }
    fallback()external payable{
        result=2;
    }
}

//what all is left
//1.enums
// 2.events
//3.try/catch
//4.function selectors
//5.abi.encode/decode
//6.hashing
//7.yul/assembly
