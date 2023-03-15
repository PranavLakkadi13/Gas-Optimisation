// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageExample {
    uint private myInteger; // by default assumes it to be 0

    // execution costs 22,236 gas
    // transaction costs 43,300 gas (21,000 trx fee, 20,000 zero to non-zero fee, 2,100 cold access fee)
    function setOne() external  {
        myInteger = 1;
    }

    // execution costs 5,158 gas
    // transaction costs 26,222 (21,000 fee + 5,000 change non-zero to non-zero + 100 warm access fee)
    function setTwo() external {
        myInteger = 2;
    }

    // execution costs 5,224 gas ==> but it will be reverted 
    // transaction cost 21,488 since the execution cost was (reverted or refund)
    function setToZero() external {
        myInteger = 0;
    }

    // execution costs 2,459 gas only when called from by a contract 
    function getInteger() external view returns(uint) {
        return myInteger;
    }

    // execution costs 22,509 gas
    // transaction fee 43,573 gas 
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

--> Pay an additional 2,100 gas if you are accessing the variable for the first time (cold access)

--> Pay an additional 100 gas if the variable was already accessed (warm access)

--> cost of doing a storage read and then a storage write costs almost equal to doing a storage write
    2100 gas (read + Cold access) + 21,000 gas (Write + Warm access) = 22,200 gas 
    22,100 gas (write + cold access)
*/
