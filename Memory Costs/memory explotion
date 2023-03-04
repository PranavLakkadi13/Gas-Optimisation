// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Memory {

    // when uint256[10] it uses 278 gas
    // when uint256[20] it uses 339 gas
    // when uint256[30] it uses 400 gas
    // when uint256[300] it uses 2,198 gas
    // when uint256[3,000] it uses 35,843 gas
    // when uint256[30,000] it uses 19,38,499 gas
    // when uint256[38,000] it uses more gas than the entire block gas limit (30,000,000 gas)
    function testmemory() external pure {
        uint256[38000] memory myarray;

    }
}

/*
-----------------------------------------------------NOTE---------------------------------------------
--> you cannot make dynamic sized array's in the memory 
--> the amount of gas to store data in the memory uses a quadratic formula that increases the gas 
    when more memory is required the amount of gas needed to pay increases exponentially.
    the formula:
    a = g(memory).a + ((a**2)/512)
--> this is in place to stop people from alloctating a lot of space in the memory since 
    not all miners can have a big memory unit 
--> you can see the amount of gas needed to stop the uint256 in certain quantity in the memory 
    and see how the cost increases the greater the number we want to store
*/
