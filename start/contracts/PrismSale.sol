// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PrismSale {
    uint256 public totalSales;
    uint256 public maxSales;

    address public owner;
    address public charity;

    mapping(address => bool) sales;

    constructor() {
        totalSales = 0;
        maxSales = 100;

        owner = 0x2117a5c3BAB6e0201a7C5e0b32D0036C9C003481;
        charity = 0x2aABFF54f5B35694748B26bBDBe0079C57bb4697;
    }

    // general structure: function to check if one can buy and (2) function to execute purchase
    function canBuy() public returns (bool) {
        return totalSales < maxSales;
    }

    function hasAccess() public returns (bool) {
        return sales[msg.sender];
    }

    function buy() public payable returns (bool) {
        require(
            canBuy() == true,
            "you're too late my friend, this boat has sailed"
        );
        require(
            msg.value == 0.01 ether,
            "this isn't the write amount... needs to be 0.01"
        );
        require(hasAccess() == false, "only one per person, matey");

        payable(owner).call{value: (msg.value * 80) / 100};
        payable(charity).call{value: (msg.value * 20) / 100};

        totalSales = totalSales + 1;

        sales[msg.sender] = true;

        return true;
    }
}
