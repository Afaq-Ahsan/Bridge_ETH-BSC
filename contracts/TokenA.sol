// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 1️⃣ Token A (Chain A) — Burnable
contract TokenA is ERC20, ERC20Burnable {
    constructor() ERC20("TokenA", "TKA") {
        _mint(msg.sender, 1000000 * 1e18);
    }
}