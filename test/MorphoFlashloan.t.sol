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
    function setUp() public {
        morphoFlashloan = new MorphoFlashloan(morpho);
    }

    function test_flashloan() public {
        assertEq(morphoFlashloan.luckyNumber(), 0);
        morphoFlashloan.takeFlashLoan(loanToken, loanAmount, callbackData);
        assertEq(morphoFlashloan.luckyNumber(), 99);
    }
}
