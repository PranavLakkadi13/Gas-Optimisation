// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract More_On_Non_Zero_gas {

    uint private myInteger;

    // First costs 43,300
    // The execution cost is 22,236 gas(first time access-> 2100, and change from 0 to non-zero -> 20,000)
    function setOne() external  {
        myInteger = 1;
    }

    // then the change to set it as 2 costs 26,222
    // the execution cost is 5158 gas (zeroness chcek -2,900 and cold acc -> 2,100)
    function setTwo() external {
        myInteger = 2;
    }
}

// ------------------------------------------NOTE----------------------------------------------
/*
--> this is more about the 5,000 gas cost when making a non-zero to non-zero change
    There no direct opcode

--> the 2 opcodes used are :
    Gsrest and Gcoldsload both taking 2,900 and 2,100 gas respectively 

--> The Gsrest is to check the zeroness on the variabe (to see if the variable value is zero)
    Gcoldsload is the access fee 

*/
