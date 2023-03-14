// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageExample {
    uint private myInteger; // by default assumes it to be 0

    // costs 22,236 gas
    function setOne() external  {
        myInteger = 1;
    }

    // costs 22,258 gas
    function setTwo() external {
        myInteger = 2;
    }

    // costs 5,224 gas
    function setToZero() external {
        myInteger = 0;
    }

    // costs 2,459 gas 
    function getInteger() external view returns(uint) {
        return myInteger;
    }

    // costs 26,467 gas 
    function getAndSetInteger() external {
        uint _Myint = myInteger;
        myInteger = _Myint + 1;
    }
}
// ----------------------------------------------NOTE---------------------------------------------
/*
--> Setting storage from 0 to non-zero costs 20,000 gas

--> setting storage from non-zero to non-zero costs 5,000 gas

--> Setting storage from non-zero to zero is a refund of gas 

--> Pay an additional 2,100 gas if you are accessing the variable for the first time 

--> Pay an additional 100 gas if the variable was already accessed

--> cost of doing a storage read and then a storage write costs almost equal to doing a storage write
    2100 gas (read + Cold access) + 21,000 gas (Write + Warm access) = 22,200 gas 
    22,100 gas (write + cold access)
*/
