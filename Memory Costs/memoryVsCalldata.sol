// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Memory {

    // 452gas when called using calldata 
    // 922gas when called using memory 
    
    // function doNothing(bytes memory _mybytes) external pure {
    
    // }

    // when calldata is used as location specifier it used 942 gas 
    // when memory is used as location specifier it used 913 gas
    function doNothing(bytes calldata _mybytes) external pure returns(bytes memory){
        bytes memory mybytes = _mybytes;
        mybytes[0] = 0x11;
        return mybytes;
    }
}

/*
---------------------------------------------------NOTE---------------------------------------------------
--> first when when giving an array or bytes array as user input then must specify memory location (memory or calldata)
--> second memory is chaper when u want to modify the given input when the input location is specified as calldata
--> we can clearly see that if we dont want to modify the given input data  and diretly assign the input data to a 
variable then using calldata is cheaper
*/
