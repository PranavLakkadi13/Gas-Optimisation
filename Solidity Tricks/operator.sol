// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// costs 247 gas 
contract lessthan{
    function lessThan(uint x) external pure returns(bool) {
        return x<3;
    }
}

// costs 250 gas 
contract lessThanEq{
    function lessthanequal(uint x) external pure returns(bool) {
        return x<=2;
    }
}

/*
------------------------------------------------------NOTE-------------------------------------------------------
--> First, solidty does not have a direct <= or >= operator

--> < and > are always more efficient than <= and >=

--> <= and >= require 2 opcodes : lessthan(<)(LT) or greaterthan(>)(GT) and ISZERO

--> Strict inequalities require only 1 opcode : lessthan(<)(LT) or greaterthan(>)(GT)
*/
