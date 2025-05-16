// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 3️⃣ Bridge A (on Chain A)
interface ITokenA {
    function burnFrom(address account, uint256 amount) external;
}

contract BridgeA is Ownable {
    event BridgeBurn(address indexed from, uint256 amount, address indexed to);

    ITokenA public tokenA;

    constructor(address _tokenA) Ownable(msg.sender) {
        tokenA = ITokenA(_tokenA);
    }

    function burn(uint256 amount, address to) external {
        tokenA.burnFrom(msg.sender, amount);
        emit BridgeBurn(msg.sender, amount, to);
    }
}