// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Hello{
// các visibility trong function
    uint value;
//private : chỉ được gọi ở trong smart contract, bên ngoài phần deploy không thấy
    function getValue() private view   returns (uint){
        return value;
    }
//internal: chỉ đc gọi ở trong smart contract và 1 cái gì đó nữa :))
    function getValue1() internal  view   returns (uint){
        return value;
    }
//external: chỉ đc gọi ở ngoài không đc họi trang hàm
    function getValue2() external   view   returns (uint){
        return value;
    }
//public: gọi ở đâu cũng đc <3 
    function getValue3() public    view   returns (uint){
        return value;
    }
    function setValue(uint _value) external  {
        
        value = _value;
    } 
}