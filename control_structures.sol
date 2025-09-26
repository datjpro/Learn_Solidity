// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld{
    bool IsTrue = true;

    function DoSomething() external  { //parameter
    //if else:
        if(IsTrue = true ){ 
            //do something
        }
        else {
            
        }
    
    //for:
        for(uint i = 0; i<10;i++){
            //do something
        }
        
    //while:
        bool isOke = true;
        while (isOke){
            //do something

        }
    //lưu lý trong smart contract hạn chế sử dụng vòng lặp, lý do tốn gas = mất tiền
    }


}