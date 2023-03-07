// SPDX-License-Identifier: MIT
pragma solidity  0.8.0;

// do a check and then make the statechange
// 21,570 gas 
contract RevertEarly {
    uint public x;

    function revertTest(uint i) external{
        require(i < 3,"Num greater than 3");
        x = i;
    }
}

// do the state change and then make a check 
// 43,679 gas
contract RevertLate {
    uint public x;

    function revertTest(uint i) external{
        x = i;
        require(i < 3,"Num greater than 3");
    }
}

// just because it is better to revert before a state change it is not compulsory to follow the rule in all cases
// in this case we are checking if the bit shifting is leading to an overflow since we cant prdict it before hand 
//  we are using a require statemnet after the statechange 
// if incase there is an overflow it will revert 
contract RevertLate2 {
    uint public x = 1;
    
    function multiplyOverflow(uint i) external view returns(uint result) {
        result = x << i;
        require(result >= x, "overflow");
    }
}
/*
---------------------------------------------------------NOTE-----------------------------------------------------
--> First, transactions that revert will still have to pay gas, if they run out out of gas they pay gas till the limit 
    if they hit a revert opcode such us a require statement or making an integer to overflow , the will still have to,
    pay gas up untill that point.
    From this we understand that we should revert as early as possible to save the user gas 

--> Second, when the revert opcode is hit all the state changes will be undone such as change in value or transfer 
    of eth , only if everything succeeds the state changes will take place

--> Third, In the RevertLate2 case we can a good use case of reverting after the state change, 
    in that case reverting is more important than saving the user gas 
*/
