// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Game{

    uint public countPlayer = 0;
    mapping (address => Player) public players; //hiểu đơn giải là 1 function nhưng ngắn gọn hơn
    enum Level{Beginner, Intermediate, Advande}

    struct Player {
        address addressPlayer;
        string fullName;
        Level playerLevel;
        uint age;
        string sex;
        uint createTime;
    }

    function addPlayer(string memory fullName, uint age, string memory sex)public {
        players[msg.sender]= Player(msg.sender,fullName,Level.Beginner,age,sex, block.timestamp);//block.timestamp dùng để lấy thời gian tại thời điểm đc tạo mới và gán vào
        countPlayer += 1;
    }

    function getPlayerLevel(address addressPlayer) public view returns  (Level){
        return players[addressPlayer].playerLevel;
    }

    function changePlayerLevel(address addressPlayer) public {
        Player storage player = players[addressPlayer]; // player sẽ được khai báo với kiểu Player và được lưu trữ trong storage
        if (block.timestamp >= player.createTime +15){
            player.playerLevel = Level.Intermediate;
        }
    }

}