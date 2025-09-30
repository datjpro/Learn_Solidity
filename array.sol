// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract myArray{
    //storage array :
    uint[] array1;


    //memory array
    //array as parameter



    function DoSomething()external{
        array1.push(2);
        array1.push(5);
        array1[1] = 9;

        delete array1[0];

        for (uint i = 0; i < array1.length ; i++){
            array1[i];
        }


    }

}