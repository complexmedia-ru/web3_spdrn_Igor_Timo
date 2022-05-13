
const hre = require("hardhat");

async function main() {

  const Contact = await hre.ethers.getContractFactory("Contact");
  const contact = await Contact.deploy("tele", "disc");

  await contact.deployed();

  console.log("Contact deployed to:", contact.address);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
