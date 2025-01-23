//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Events{
struct Student{
    string name;
    string emailId;
    uint256 contactNumber;
    uint256 rollNumber;
    uint256 timestamp;
}
mapping (uint256=> Student) public studentDatabase;
uint256 rollNumber=1;
event studentAdded(string name,uint256 rollNumber,uint256 timestamp);
function addStudent(
    string memory _name ,  //memory is used to temporarily store the data while running the code
    uint256 _contactNumber,
    string memory _emailId )
    public {
        studentDatabase[rollNumber].name=_name;
        studentDatabase[rollNumber].contactNumber=_contactNumber;
        studentDatabase[rollNumber].emailId=_emailId;
        studentDatabase[rollNumber].rollNumber=rollNumber;
        studentDatabase[rollNumber].timestamp=block.timestamp;
        emit studentAdded(_name, rollNumber , block.timestamp);
        rollNumber++;
    }

}