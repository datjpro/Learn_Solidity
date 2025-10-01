// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract myStruct{
    struct player{
        uint ID;
        address playerAddress;
        string Name;
    }

    function foo() external {
        player memory player1 = player(1,msg.sender,"1");
        player memory player2 = player(2,msg.sender,"name");

        player1.Name;
        player1.Name= "hello";
        delete player2;
    }
}