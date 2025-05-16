// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 4️⃣ Bridge B (on Chain B)
interface ITokenB {
    function mint(address to, uint256 amount) external;
}

contract BridgeB is Ownable {
    ITokenB public tokenB;
    constructor(address _tokenB)Ownable(msg.sender) {
        tokenB = ITokenB(_tokenB);
    }

    function mintTo(address to, uint256 amount) external onlyOwner {
        tokenB.mint(to, amount);
    }
}