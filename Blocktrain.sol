//SPDX-License-Identifier:MIT

//CRUD OPERATIONS(create, reset,update,delete)

pragma solidity >=0.8.4;
contract Blocktrain{
    uint256 coins=0;

    function add()public{
        coins+=1;
            }
            function subtract()public{
                coins-=1;
            }
            function set(uint256 _coins) public
            {
                coins = _coins;
            }
            function get() public view returns (uint256) 
{
    return coins;
            }
            //control statements
            function add(uint256 _num) public{
                if(_num==100)
                {
                    coins+=_num;
                }
                else if(_num<100)
                {
                    coins+=100;
                }
                else {
                    //just leave
                }
            }
}