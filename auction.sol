// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

    //-Bid:
        //thời gian đấu giá phải diễn ra trong thời gian đấu giá(The auction must take place within the auction period.)
        //giá đặt phải là giá lớn nhất(The bid must be the maximum bid.)
        //giá đặt phải >0 (bảo mật) (bid must be >0 (confidential))
    //Withdraw:
        //amount >0 && amount == bid
        //sau khi rút, after send = 0(after withdraw, after send = 0)
    //AuctionEnd:
        //khi nào kết thúc phiên đấu giá(when does the auction end)
        //sự kiện : tranfer (event: transfer)

    //Knowledge:
        //payable là 1 lớp bảo mật, chắc chắn phải có tranfer thì nó mới hoạt động(lớp bảo vệ thứ 2) (payable is a layer of security, it must have a transfer for it to work (second layer of protection))
        //revert xảy ra đưa ra mess và kết thúc function (revert occurs, throws mess and ends function)
        //unicode"mess": Đưa ra mess có dấu
contract simpleAuction{
    
    //variable
    uint public auctionEndTime;
    uint public highestBid;
    address public highestBidder;
    mapping (address => uint) public pendingReturns;
    bool ended = false;
    address payable public beneficiary;
    
    //event
    event highestBidIncrease(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);

    //contructer
    constructor(uint _biddingTime, address payable _beneficiary ){
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    //function
    function bid() public payable {  //function đặt giá trị đấu giá

        if (block.timestamp > auctionEndTime ){ //kiểm tra thời gian đấu giá hợp lệ
            revert(unicode"Phiên đấu giá đã kết thúc!(The auction has ended!)");
        }
        if (msg.value < highestBid){ //kiểm tra giá trị đấu giá hợp lệ
            revert(unicode"Giá của bạn thấp hơn giá cao nhất!(Your price is lower than the highest price!)");
        }
        if (highestBid != 0){ //xác định giá đấu giá cao nhất phải >0
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncrease(msg.sender,msg.value);

    }

    function withdraw() public returns(bool){ //function rút tiền

        uint amount = pendingReturns[msg.sender];
        if (amount > 0){
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    function auctionEnd() public { //function thời gian kết thúc của phiên đấu giá
        if(ended){
            revert(unicode"Thời gian đấu đã có thể kết thúc!(The match time may have ended.)");
        }
        if(block.timestamp < auctionEndTime){
            revert(unicode"Thời gian đấu giá chưa kết thúc!(The auction is not over yet.)");
        }
        ended = true;
        emit auctionEnded(highestBidder,highestBid);
        
        beneficiary.transfer(highestBid);

    }
}