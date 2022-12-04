//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
//Get funds fron users
// Withdraw funds
// Set a minimum funding value in USD

import "./PriceConverter.sol";
error NotOwner();
contract FundMe {
    using PriceConverter for uint256;
    //constant , immutable
    uint256 public constant MINIMUM_USD = 10*1e18; // optimized

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    address public immutable i_owner; // optimized
    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable{
        //want to set minimum amount in USD
        // 1. How do we send ETH to this contract
        
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough"); // 1e18 = 10^18 wei = 1 eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        // reverting message returns the extra gas required for computation
    }

    function withDraw () onlyOwner public {
        //set mapping to zero
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
            address funderAddress = funders[funderIndex];
            addressToAmountFunded[funderAddress] = 0;
        }
        
        //reset the array
        funders = new address[](0);

        //actually withdraw money
        
        //transfer- 1st method
        //msg.sender = address
        //payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);

        //send- 2nd method
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed!");
        
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "You are no the Owner!");
        _; // do the rest of code
        if(msg.sender != i_owner) {
            revert NotOwner(); // new
        }
    }
    // What happen if someone sends contract funds without funds function.

    //receive() , fallback() special funtions
    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
    
}
