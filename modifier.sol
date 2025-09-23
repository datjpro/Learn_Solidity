// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Firstcoin{
    address public minter;// 
    mapping (address => uint) public balances; 

    event sent(address from, address to, uint amount);

    modifier onlyMinter{
        require(msg.sender == minter);
        _;// khi được gọi ra mới đc chạy
    }

    modifier checkamount(uint amount){
        require(amount < 1e60);
        _;
    }

    modifier checbalances(uint amount){
        require(amount <= balances[msg.sender], "Khong du tien ma doi chuyen");
        _;
    }

    constructor() {
        minter = msg.sender;
    }   

    function mint(address receiver, uint amount) public onlyMinter checkamount(amount) {
        
        
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public checbalances(amount) {
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }

}

contract ContractCha {
    address public owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract ContractCon is ContractCha {
    // ContractCon có thể sử dụng biến owner và modifier onlyOwner
}