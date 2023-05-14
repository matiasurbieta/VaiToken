import { expect } from "chai";
import { ethers } from "hardhat";
import { Contract, ContractFactory } from "ethers";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";

describe("VaiToken", function () {
  let VaiToken: ContractFactory;
  let vaiToken: Contract;
  let owner: SignerWithAddress;
  let alice: SignerWithAddress;
  let bob: SignerWithAddress;

  beforeEach(async function () {
    VaiToken = await ethers.getContractFactory("VAIToken");
    [owner, alice, bob] = await ethers.getSigners();
    vaiToken = await VaiToken.deploy(100, "VAI Token", 18, "VAI");
  });

});
