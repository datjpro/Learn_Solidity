//bài 3 
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract datatypes{
    bool myBoolean = true ; //false
    uint myUnsignedInteger = 10; 
    int myInteger =-11; // sử dụng ít hơn
    string myString = "Hello world";
    address myAddress = msg.sender; // đặc biệt
}

contract Game{

    uint public countPlayer = 0;
    mapping (address => Player) public players; //hiểu đơn giải là 1 function nhưng ngắn gọn hơn
    enum Level{Beginner, Intermediate, Advande}

    struct Player {
        address addressPlayer;
        string fullName;
        Level myLevel;
        uint age;
        string sex;
    }

    function addPlayer(string memory fullName, uint age, string memory sex)public {
        players[msg.sender]= Player(msg.sender,fullName,Level.Beginner,age,sex);
        countPlayer += 1;
    }

    function getPlayerLevel(address addressPlayer) public returns  (Level){
        return players[addressPlayer].myLevel;
    }

}