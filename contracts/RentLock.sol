// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

//Contract Rentlock
contract RentLock is ReentrancyGuard {
    // Address of the party that holds the security deposit
    address payable owner;
    // Address of the other party
    address payable taker;
    // fee address
    address payable feeAddress;
    // Rent amount
    uint256 public rentAmount;
    // Duration of the agreement in months
    uint256 public durationMonths;
    // Security deposit amount
    uint256 public securityDeposit;
    // Start date of the agreement
    uint256 public startDate;
    // End date of the agreement
    uint256 public endDate;
    // Days for the other party to make the payment
    uint256 public daysForPayment;
    // Delay payment in days
    uint256 public daysDelay;
    //Taker balance
    uint256 public takerBalance;
    //Application fee
    uint transferFee;
    uint fee;

    // Deposit event
    event Deposit(address indexed contractAddress, address indexed from, uint amount);

    // Event to emit when funds are deposited
    event FundsDeposited(address indexed takerDeposit, uint256 amount);

    using SafeMath for uint256;

    // Constructor to initialize the contract
    constructor(
        address payable _owner, 
        address payable _taker, 
        address payable _fee,
        uint256 _securityDeposit, 
        uint256 _rentAmount,
        uint256 _endDate, 
        uint256 _daysForPayment) {
        // Store the address of the owner
        owner = _owner;
        // Store the address of the taker
        taker = _taker;
        // Store the security deposit amount
        securityDeposit = _securityDeposit;
        // rent amount
        rentAmount = _rentAmount;
        // Store the end date of the agreement
        endDate = _endDate;
        // Set the start date to the current block timestamp
        startDate = block.timestamp;
        // set day delay
        daysDelay = block.timestamp;
        // Store the days for the other party to withdraw the money if the payment does no happens
        daysForPayment = _daysForPayment;
        //Fee
        transferFee = 1;
        feeAddress = payable(_fee);
    }

      //Fallback function
    fallback () external payable {
        emit Deposit(address(this), msg.sender, msg.value);
    } 

    //Receive function
    receive () external payable {
        emit Deposit(address(this), msg.sender, msg.value);
    }


    // Function to deposit funds to the contract
    function deposit(address _taker) external payable {
        require(_taker == taker, "Only the taker can deposit funds");
        takerBalance += msg.value;
        // verify the rent payment
        if (address(this).balance > securityDeposit + rentAmount){
            daysDelay = block.timestamp;
        }
        emit FundsDeposited(_taker, msg.value);
    }

    // Function for the buyer or seller to withdraw the security deposit

    function withdraw(address _user) external payable nonReentrant {
        require (address(this).balance != 0, "Contract don't have funds");
        require (block.timestamp < endDate, "Time is not over yet");
        // If the contract is active and the owner want to withdraw the rent
        if (daysDelay + daysForPayment < block.timestamp && address(this).balance > securityDeposit) {
            require (owner == _user, "You are not the owner");
            owner.transfer(address(this).balance.sub(securityDeposit));
        }
        // Rent not paid
        else if (daysDelay + daysForPayment > block.timestamp && endDate < block.timestamp) {
            require (owner == _user, "You are not the owner");
            fee = address(this).balance.mul(transferFee).div(100);
            owner.transfer(address(this).balance.sub(fee));
            feeAddress.transfer(fee);
        }

        // Rent paid. Deposit refund after the days delay time
        else if  (endDate > block.timestamp && daysDelay + daysForPayment > block.timestamp) {
            require (taker == _user, "You are not the taker");
            fee = address(this).balance.mul(transferFee).div(100);
            owner.transfer(address(this).balance.sub(securityDeposit + fee));
            feeAddress.transfer(fee);
            taker.transfer(address(this).balance);
        }
    }

 
    function returnOwner() public view returns(address){
        return owner;
    }

    function returnTaker() public view returns(address){
        return taker;
    }

    function returnTakerBalance() public view returns(uint){
        return takerBalance;
    }

        function returnRentAmount() public view returns (uint) {
        return rentAmount;
    }

    function returnStartDate() public view returns (uint) {
        return startDate;
    }

    
    function returnSecurityDeposit() public view returns(uint){
        return securityDeposit;
    }

    function returnEndDate() public view returns(uint){
        return endDate;
    }

    function returnDaysForPayment() public view returns(uint){
        return daysForPayment;
    }

}
