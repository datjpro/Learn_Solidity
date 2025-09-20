// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Firstcoin{
    address public minter;// khai báo biến lưu trữ địa chỉ người tạo
    mapping (address => uint) public balances; // khai báo biến lưu trữ số dư của từng địa chỉ

    event sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], "Khong du tien ma doi chuyen");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }

}