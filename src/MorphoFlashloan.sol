// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;
import {IMorphoFlashLoanCallback} from "./interfaces/morpho/IMorphoFlashLoanCallback.sol";
import {IMorpho} from "./interfaces/morpho/IMorpho.sol";
import {TokenTransferHelper} from "./utils/TokenTransferHelper.sol";

contract MorphoFlashloan is TokenTransferHelper, IMorphoFlashLoanCallback {
    IMorpho private immutable MORPHO;
    uint public luckyNumber;

    constructor(address newMorpho) {
        MORPHO = IMorpho(newMorpho);
    }

    function takeFlashLoan(
        address token,
        uint256 assets,
        bytes calldata data
    ) external {
        MORPHO.flashLoan(token, assets, data);
    }

    function onMorphoFlashLoan(
        uint256 assets,
        bytes calldata data
    ) external override {
        require(msg.sender == address(MORPHO));
        address token = abi.decode(data, (address));
        _doSomethingWithFlashLoan(data);
        // repaying the flashloan (morpho will pull tokens from us)
        _callApprove(token, address(MORPHO), assets);
    }

    function _doSomethingWithFlashLoan(bytes memory data) internal virtual {
        // do some arbitrage or etc...
        (, luckyNumber) = abi.decode(data, (address, uint256));
    }
}
