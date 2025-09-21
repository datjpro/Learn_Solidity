# Học Solidity

## Solidity là gì?

Solidity là một ngôn ngữ lập trình hướng hợp đồng (contract-oriented), có kiểu tĩnh, được thiết kế để phát triển smart contract chạy trên Ethereum Virtual Machine (EVM). Nó được ảnh hưởng bởi C++, Python và JavaScript, và được thiết kế để hoạt động trên blockchain Ethereum.

## Đặc điểm chính

- **Phát triển Smart Contract**: Được xây dựng chuyên biệt để tạo các ứng dụng phi tập trung (DApps)
- **Kiểu tĩnh**: Kiểm tra kiểu dữ liệu tại thời điểm biên dịch
- **Hướng đối tượng**: Hỗ trợ kế thừa, thư viện và các kiểu dữ liệu phức tạp do người dùng định nghĩa
- **Tương thích EVM**: Chạy trên Ethereum và các blockchain tương thích EVM khác

## Cú pháp cơ bản

### Cấu trúc Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // Biến trạng thái
    uint256 public number;

    // Constructor
    constructor() {
        number = 0;
    }

    // Hàm
    function setNumber(uint256 _number) public {
        number = _number;
    }
}
```

## Kiểu dữ liệu

### Kiểu giá trị (Value Types)

- **bool**: Giá trị boolean (`true` hoặc `false`)
- **int/uint**: Số nguyên có dấu và không dấu (8 đến 256 bits)
- **address**: Địa chỉ Ethereum (20 bytes)
- **bytes**: Mảng byte có kích thước cố định
- **string**: Chuỗi UTF-8 động

### Kiểu tham chiếu (Reference Types)

- **arrays**: Mảng động hoặc có kích thước cố định
- **mapping**: Bảng băm (cặp key-value)
- **struct**: Cấu trúc dữ liệu tùy chỉnh

## Phạm vi truy cập hàm

- **public**: Có thể truy cập từ bất kỳ đâu
- **private**: Chỉ trong cùng contract
- **internal**: Trong contract và các contract kế thừa
- **external**: Chỉ từ bên ngoài contract

## Tính chất thay đổi trạng thái

- **view**: Hàm chỉ đọc
- **pure**: Không đọc hoặc ghi trạng thái
- **payable**: Có thể nhận Ether
- **nonpayable**: Không thể nhận Ether (mặc định)

## Công cụ phát triển

### Công cụ thiết yếu

- **Remix IDE**: IDE trên trình duyệt cho Solidity
- **Hardhat**: Framework phát triển
- **Truffle**: Bộ công cụ phát triển
- **Ganache**: Blockchain cá nhân để test
- **MetaMask**: Ví Ethereum để test

### Cài đặt (Sử dụng Hardhat)

```bash
npm init -y
npm install --save-dev hardhat
npx hardhat
```

## Mẫu thường dùng

### Events

```solidity
event Transfer(address indexed from, address indexed to, uint256 value);

function transfer(address to, uint256 amount) public {
    // Logic chuyển tiền
    emit Transfer(msg.sender, to, amount);
}
```

### Modifiers

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Không phải chủ sở hữu");
   _;
}

function restrictedFunction() public onlyOwner {
    // Chỉ chủ sở hữu mới có thể gọi
}
```

## Nguyên tắc bảo mật

1. **Sử dụng phiên bản Compiler mới nhất**: Luôn dùng phiên bản Solidity gần đây
2. **Kiểm tra tràn số**: Sử dụng SafeMath hoặc kiểm tra tích hợp của Solidity 0.8+
3. **Bảo vệ Reentrancy**: Sử dụng ReentrancyGuard
4. **Xác thực đầu vào**: Luôn kiểm tra tham số hàm
5. **Kiểm soát truy cập**: Triển khai hệ thống phân quyền phù hợp

## Tài liệu học tập

- [Tài liệu Solidity](https://docs.soliditylang.org/)
- [Hướng dẫn Solidity trên Ethereum.org](https://ethereum.org/en/developers/tutorials/)
- [CryptoZombies](https://cryptozombies.io/)
- [OpenZeppelin Contracts](https://openzeppelin.com/contracts/)

## Cấu trúc dự án

```
Learn_Solidity/
├── contracts/          # File smart contract
├── scripts/            # Script triển khai
├── test/              # File test
├── hardhat.config.js  # Cấu hình Hardhat
└── README.md         # File này
```

## Bắt đầu

1. Thiết lập môi trường phát triển
2. Học cú pháp Solidity cơ bản
3. Thực hành với các contract đơn giản
4. Nghiên cứu các mẫu thường dùng và thực hành bảo mật
5. Xây dựng và triển khai DApp đầu tiên

Chúc bạn học tốt! 🚀
