import { ethers } from "hardhat";

async function main() {
  const HappyVAIToken = await ethers.getContractFactory("HappyVAIToken");
  const token = await HappyVAIToken.deploy();

  await token.deployed();

  console.log(`HappyVAIToken deployed to ${token.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
