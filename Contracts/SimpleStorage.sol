//SPDX-License-Identifier: MIT
pragma solidity 0.8.24; //stating our version

contract SimpleStorage{
//Basic types: boolean,uint,int,bytes,address
//bool hasFavoriteNumber=true;//default value is false
//uint256 favoriteNumber=88;//default value is 0
//string favoriteNumberText="eighty-eight";
//int256 favoriteInt=-88;
//address myAddress=0xE878E91881C0fF35E55985B4a0aCa81FdE9e674c;
//bytes32 favoriteBytes32="cat";//largest bytes is 32
uint256 public myfavoriteNumber;//0
//uint256[] listoffavoriteNumbers;// [0,78,52]
struct Person{     //every person has it's own favorite number and his/her name
uint256 favoriteNumber;
string name;
}

//dynamic array
Person[] public listOfPeople;

//creating mapping
// sakshi->63
mapping(string => uint256) public nameToFavoriteNumber;



//Person public ary=Person({favoriteNumber:7,name:"Arya"});
//Person public sak=Person({favoriteNumber:10,name:"Sakshi"});
//this is isn't a good way of declaring so use arrays

function store(uint256 _favoriteNumber)public virtual{
myfavoriteNumber=_favoriteNumber;
}
function retrieve()public view returns(uint256){//just to print the value of favoriteNumber
    return myfavoriteNumber;
}//view disallow any other type of modification in its own function
//calldata,memory,storage
//uint is considered as primitive type and string is array/list that is the reason memory keyword is used before name only and not favoritenumber
function addPerson(string memory _name, uint256 _favoriteNumber)public {
listOfPeople.push(Person(_favoriteNumber, _name));  //creates a new person everytime
nameToFavoriteNumber[_name]=_favoriteNumber;//everytime you input a name then you will get their favorite number 

}
}
contract SimpleStorage2{}
contract SimpleStorage3{}
contract SimpleStorage4{}

