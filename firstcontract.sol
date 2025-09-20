pragma solidity >=0.7.0 <0.9.0;

// khởi tạo 1 smart contract
contract firstcontract {
    uint public saveData;// khai báo biến lưu trữ dữ liệu

    // hàm lưu trữ dữ liệu
    function set(uint x) public   {
        saveData = x;
    }   
    
    // hàm lấy dữ liệu
    function get() public view returns (uint x) {
        return saveData;
    }  
}