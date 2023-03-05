// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract funcName {

    // cost of calling green() with no other function present in the contract is 146 gas
    // cost of calling green() with blue() function present in the contract is 168 gas 
    // cost of calling green() with both blue() and red() function present in the contract is 190 gas 
    function green() external pure returns(uint){
        return 1;
    }

    // cost of calling blue() when only green() func is present is 146 gas
    // cost of calling blue() when green() and red() func are present is 168 gas
    function blue() external pure returns(uint){
        return 1;
    }

    // cost of calling red() when both green() and blue() are present is 146 gas 
    function red() external pure returns(uint){
        return 1;
    }
}
/*
-----------------------------------------------------NOTE---------------------------------------------------------
--> First, to notice is in the compilation details lookup function hashes:(upto the 4 bytes)
    {
	"ed18f0a7": "blue()",
	"f2f1e132": "green()",
	"2930cf24": "red()"
    }

--> Second, we know that the output is in hexadecimal order and therefore it will sorted in assending order
    ie, 2 < e < f
    by the compilier before it selects the function based on the user input

--> Third, in the above case we can see each function has 22 gas increase this is beacuse tif u look at the opcode 
    we can clearly see in the case of a function being selected the steps required to run he function will cost 22 gas

    Therefore, we can see that green takes 44 gas more than red since the hexademial order kept green at the last
    therefore adding the cost of each check to call green()

--> the opcode between each function is :
    PUSH - 3 gas
    EQ - 3 gas 
    PUSH - 3 gas 
    JUMP - 10 gas 
    DUP1 - 3 gas 

--> CONCLUTION - 
    is that when u name a fuction that uses a large amount of gas name it in way that its Hex code starts with the 
    smallest number so that it can avoid the checks needed of other functions. Thus, saving gas!!!
*/
