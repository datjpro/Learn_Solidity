// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract myEvent{

    event deposit(address from, uint amount);
    //đẩy thông tin từ smc ra bên ngoài, dùng để bên thứ 3 bắt được và sử dụng để xác nhận
    function foo(uint amount) external {
        emit deposit(msg.sender, amount);
    }


}