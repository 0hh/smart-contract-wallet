// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract SmartContractWallet {

    address payable public owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public guardians;
    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardiansForRest = 3;

    constructor() {
        owner = payable(msg.sender);  
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting");
        guardians[_guardian] = _isGuardian;
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[msg.sender] = _amount;

        if(_amount > 0) {
            isAllowedToSend[msg.sender] = true;
        } else {
            isAllowedToSend[msg.sender] = false;
        }
    }
    

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
        //require(msg.sender == owner, "You are not the contract owner, aborting");
        if(msg.sender != owner) {
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
            require(isAllowedToSend[msg.sender], "You are not allowed to send anything from this smart contract, aborting");

            allowance[msg.sender] >= _amount;
        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Call was not successful, aborting");
        return returnData;

    }

    receive() external payable {}

    fallback() external payable{}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
