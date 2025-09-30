// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract myArray{
    //storage array
    //memory array :được lưu trong funcion, chỉ đc khai báo ở trong function, khai báo độ dài
    //array as parameter
    uint[] array1;


    function DoSomething()external{
        array1.push(2);
        array1.push(5);
        array1[1] = 9;
        delete array1[0];
        for (uint i = 0; i < array1.length ; i++){
            array1[i];
        }
    }

    function bar() external{
        uint[] memory array2 = new uint[](10);
        array2[0] = 2;
        array2[1] = 7;
        delete array2[0];
    }

    function foo(uint[] calldata array3) external {
        
    }




}