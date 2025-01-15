// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MorphoFlashloan} from "../src/MorphoFlashloan.sol";

/// @notice Tests flashloan on `Base` chain
contract MorphoFlashloanTest is Test {
    MorphoFlashloan public morphoFlashloan;
    address public morpho = 0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb;
    address public loanToken = 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913; // USDC on base
    uint public loanAmount = (1 * 10 ** 6) * 10 ** 6;
    bytes public callbackData = abi.encode(loanToken, 99);
    address public ethWhale = 0xF977814e90dA44bFA03b6295A0616a897441aceC; // ethWhale on base
    function setUp() public {
        morphoFlashloan = new MorphoFlashloan(morpho);
    }

    function test_flashloan() public {
        assertEq(morphoFlashloan.luckyNumber(), 0);
        vm.prank(ethWhale);
        morphoFlashloan.takeFlashLoan(loanToken, loanAmount, callbackData);
        assertEq(morphoFlashloan.luckyNumber(), 99);
    }
}
