// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract myMapping {
    mapping (address => uint) balances;
    mapping(address => mapping(address => bool)) approved;

    function foo() external{
        //add & update
        balances[msg.sender] = 100;
        balances[msg.sender] = 200;
        balances[msg.sender];
        delete balances[msg.sender];

        //default value
        //balances[keyNotExist]  ==> 0

        //nested mapping
        //approved[msg.sender][spender] ==> true 

    }
}
  

