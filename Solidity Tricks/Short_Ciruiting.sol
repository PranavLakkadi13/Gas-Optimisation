// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

// Short circuit is a method to save gas when we use and(&) or(||) operators 

contract shortciruit {

    bool publicmint = true;
    mapping (address => bool) public allowed;

    function addToAllowed(address _address) public{
        allowed[_address] = true;
    }

    // timestamp check costs 3 gas 
    // mapping check costs 2100 gas as it has to read from the memory 
    function shortCircuit() external {
        require(block.timestamp > 16771135 || allowed[msg.sender],"Invalid");
    }
}
/*
----------------------------------------------------NOTE---------------------------------------------------
--> Like most languages solidity short-cut evaluates AND and OR operators
    i.e, if we evaluate an X OR(||) Y (boolean evaluation): => x || Y 
    if X is true then the check for y will be skipped and the entire thing is marked true
    
    similarly the converse happens in AND operator (X && Y):
    If X is false then the check for y will be skipped and the entire thing is marked false 

--> If their is a substancial gas cost difference between the operation of X and Y then it  is only logical
    to keep the cheaper check first 

--> In the above example of the require statement we have an OR condition
    here we know that timestamp check costs 3 gas and the mapping check costs 2100 gas as it has to read 
    from memory so we kept the timestamp first 

--> Suppose we want to check the the allowed list first so that the allowed address get first priority 
    later the timestamp then it will make sense to do the allowed check first 

*/
