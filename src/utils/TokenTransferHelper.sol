// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;
import {SafeERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
contract TokenTransferHelper {
    using SafeERC20 for IERC20;

    function _transferTokens(
        address token,
        address to,
        uint256 amount
    ) internal {
        IERC20(token).safeTransfer(to, amount);
    }

    function _pullTokens(
        address token,
        address from,
        address to,
        uint amount
    ) internal {
        IERC20(token).safeTransferFrom(from, to, amount);
    }

    function _callApprove(
        address token,
        address spender,
        uint amount
    ) internal {
        IERC20(token).forceApprove(spender, amount);
    }
}
