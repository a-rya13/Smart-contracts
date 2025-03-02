//SPDX-License-Identifier:MIT


//trying to make one owner and he can decide a manager also. 
// Then customer details can only be seen by customers,wonder and manager itself.
pragma solidity >=0.8.18 <0.9.0;
contract HotelRoom{
    address public manager; //manager assigned by the owner
    address payable public owner; //contract owner
    enum Stateuses{Vacant, Occupied}
    Stateuses currentState;
    struct Hotel{
        string name;
        string emailId;
        uint256 mobile_no;
        uint timestamp;
    }
    constructor(){
        owner=payable(msg.sender);
        currentState=Stateuses.Vacant;
    }
    modifier onlyWhileVacant{
        require(currentState == Stateuses.Vacant,"Currently occupied");
        _;
    }
    modifier costs(uint _amount){
    require(msg.value>=_amount,"Not enough ether provided");
    _;
    }
    //function to book a room
    receive() external payable onlyWhileVacant costs(0 ether){
        owner.transfer(msg.value);
        currentState=Stateuses.Occupied;
    }
    //function to reset a room and can only be done by the owner
    function resetRoom() public{
        require(msg.sender==owner,"Only the owner can reset the room ");
        currentState=Stateuses.Vacant;
    }
   
}