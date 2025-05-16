# 🌉 Cross-Chain Token Bridge (TokenA ↔ TokenB)

This project implements a **basic cross-chain token bridge** that allows users to **burn TokenA on one chain (e.g., Ethereum)** and **mint TokenB on another chain (e.g., BSC)** using an off-chain service that listens to burn events and relays minting transactions.

---

## 🛠️ Components

### 🔗 Smart Contracts

| Contract | Chain | Description |
|----------|-------|-------------|
| `TokenA.sol` | Chain A (e.g., Ethereum) | ERC20 token to burn |
| `BridgeA.sol` | Chain A | Handles burning of `TokenA` and emits events |
| `TokenB.sol` | Chain B (e.g., BSC) | ERC20 token to mint |
| `BridgeB.sol` | Chain B | Handles minting of `TokenB`, only callable by owner (off-chain relayer) |

---

### 🧠 Off-chain Relayer Script

- Listens to `BridgeA` for `Burn` events
- Calls `BridgeB.mintTo(address, amount)` on the destination chain
- Runs using `ethers.js` or `web3.js`

---

## 🔁 Flow Overview

1. User burns `TokenA` on `BridgeA`
2. `BridgeA` emits a `Burn` event
3. Off-chain script picks up the event and sends a transaction to `BridgeB.mintTo()`
4. `BridgeB` mints `TokenB` to the user

