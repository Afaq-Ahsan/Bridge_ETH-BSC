const { ethers } = require("ethers");
require("dotenv").config();

const providerA = new ethers.JsonRpcProvider(process.env.SEPOLIA_RPC);
const providerB = new ethers.JsonRpcProvider(process.env.BSC_TESTNET_RPC);
const walletB = new ethers.Wallet(process.env.PRIVATE_KEY, providerB);

const bridgeAABI = [
    "event BridgeBurn(address indexed from, uint256 amount, address indexed to)"
];

const bridgeBABI = [
    "function mintTo(address to, uint256 amount) external"
];

const bridgeAAddress = process.env.BRIDGE_A_ADDRESS;
const bridgeBAddress = process.env.BRIDGE_B_ADDRESS;

const bridgeA = new ethers.Contract(bridgeAAddress, bridgeAABI, providerA);
const bridgeB = new ethers.Contract(bridgeBAddress, bridgeBABI, walletB);

bridgeA.on("BridgeBurn", async (from, amount, to, event) => {
    console.log(`Burn: ${amount} from ${from}, minting to ${to}`);
    try {
        const tx = await bridgeB.mintTo(to, amount);
        console.log("Mint tx sent:", tx.hash);
        await tx.wait();
        console.log("Mint confirmed");
    } catch (err) {
        console.error("Mint failed:", err);
    }
});
