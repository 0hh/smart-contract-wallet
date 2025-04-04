// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SmartContractWallet {

    address payable public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() {
        owner = payable(msg.sender);  
    }

    receive() external payable {}

    fallback() external payable{}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
