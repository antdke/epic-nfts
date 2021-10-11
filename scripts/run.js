const main = async () => {
  const myEpicNFTFactory = await hre.ethers.getContractFactory('MyEpicNFT'); // this compiles the contract
  const myEpicNFT = await myEpicNFTFactory.deploy(); // this deploys to local blockchain
  await myEpicNFT.deployed();

  console.log("Contract deployed to:", myEpicNFT.address);

  // Call the function.
  let txn = await myEpicNFT.makeAnEpicNFT()
  // Wait for it to be mined.
  await txn.wait()

  // Mint another NFT for fun.
  txn = await myEpicNFT.makeAnEpicNFT()
  // Wait for it to be mined.
  await txn.wait()
}

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

runMain();