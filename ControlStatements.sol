//SPDX-License-Identifier:MIT

pragma solidity 0.8.19;

contract ControlStatements{
    mapping(uint256 => string)public students;
    //Types of Loop
    //1.For Loop
    function add(uint256 _num)public{
        for(uint256 i=0;i<_num;i++)
        {
            students[i]="Blocktrain";
        }
    } 
    //2.While Loop
    function addNames(string[] memory _names)public{
        uint256 i=0;
        while(i<_names.length)
        {
            students[i]=_names[i];
            i++;
        }
    }
    //3.Do-While Loop
    function letsBreak(uint256 _num) public{
        do{
            students[0]="Blocktrain";

        }while(_num<0);
    }
    //Break keyword

    uint256 public coins=0;
    function something()public{
        for(uint256 i=0;i<10;i++)
        {
            if(i==4)
            {
                break;
            }
        coins++;
    }
}
}
