// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Try {
    address public owner;
    uint256 public result; // State variable to store the result

    // Set the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Modifier to allow only the owner to execute certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "not allowed");
        _;
    }

    // Function to perform the calculation
    function alter(uint256 number) public onlyOwner {
        result = number * 2; // Perform calculation and store in state variable
    }

    // Function to return the calculated result
    function withdraw() public view onlyOwner returns (uint256) {
        return result;
    }
}
