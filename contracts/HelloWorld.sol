pragma solidity ^0.8.0;

contract RequireAssertRevert {
    
    function withdraw(uint amount) public {
        require(amount <= address(this).balance, "Not enough balance."); // check if contract has enough balance
        msg.sender.transfer(amount); // send requested amount to the sender
    }
    
    function divide(uint numerator, uint denominator) public pure returns (uint) {
        require(denominator != 0, "Cannot divide by zero."); // check if denominator is not zero
        return numerator / denominator;
    }
    
    function doSomething(bool flag) public {
        if (flag) {
            assert(2 + 2 == 5); // will cause the transaction to revert as the assertion is false
        } else {
            revert("Something went wrong."); // will revert the transaction with a custom error message
        }
    }
    
}
