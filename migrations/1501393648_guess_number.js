var GuessNumber = artifacts.require("./GuessNumber.sol");
var GuessNumberV2 = artifacts.require("./GuessNumberV2.sol");
var GuessNumberV3 = artifacts.require("./GuessNumberV3.sol");
var GuessNumberV4 = artifacts.require("./GuessNumberV3.sol");
var CapitalDictionary = artifacts.require("./CapitalDictionary.sol");
var ContinentDictionary = artifacts.require("./ContinentDictionary.sol");

module.exports = function(deployer) {
  deployer.deploy(GuessNumber, 1, 2, 3);
  deployer.deploy(GuessNumberV2, 1, 2, 3);
  deployer.deploy(GuessNumberV3, 1, 2, 3);
  deployer.deploy(GuessNumberV4, 1, 2, 3);
  deployer.deploy(CapitalDictionary);
  deployer.deploy(ContinentDictionary);
};
