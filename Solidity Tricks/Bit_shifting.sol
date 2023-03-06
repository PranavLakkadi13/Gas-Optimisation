// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Bit shifting - when u multiply/divide a number by 2 u are basically shifting the each bit of the number to either
               right or to the left.
eg:
5 = 00101
5 * 2 = 10 = 01010 in binary is obtained by shifting each bit in 5 to the left by 1postion
5 / 2 = 2.5 = 2  = 00010 in binary it is obtained by shifting each bit in 5 to right by 1 position 
*/

contract Regular {

    // costs 265 gas to call 
    function multiplyByTwo(uint x) external pure returns(uint) {
        unchecked {
            return x*2;
        }
    }

    // costs 246 gas to call
    function divideByTwo(uint x) external pure returns(uint) {
        unchecked {
            return x/2;
        }
    }
}

contract shift_Bit {

    // costs 263 gas to call 
    function multiplyByTwo(uint x) external pure returns(uint) {
        return x<<1;
    }

    //  costs 241 gas to call 
    function divideByTwo(uint x) external pure returns(uint) {
        return x>>1;
    }
}
/*
----------------------------------------------------------NOTE------------------------------------------------------
--> First, solidity doesnt have floating point numbers 

--> Second, in the Regular contract u can see that i have the unchecked keyword for both the multiplication and 
    division this is because unchecked keyword doenst look for overflow or underflow case like the default would 
    in solidity version ^0.8.0 

--> Third, the bit shifting wont look for the underflow or overflow case and it should be used cautiously even tho
    it saves gas 

--> Therefore we can see in the case of multiplying we can save around 2 gas and in the case of dicide we can save 
    around 4 gas , conslusion we have used cheaper opcodes thus saving gas 
*/
