var ContinentDictionary = artifacts.require('./ContinentDictionary.sol');

contract('ContinentDictionary', function(accounts) {
  var dictionary;
  it("should pass all", function() {
    return ContinentDictionary.deployed().then(function(instance){
      dictionary = instance;
      return dictionary.getContinent.call(0);
    }).then(function(result){
      assert.isTrue(result === 'Africa');
      return dictionary.getContinent.call(4);
    }).then(function(result){
      assert.isTrue(result === 'Europe');
    }); 
  });
  it("should pass all as well", function() {
    return ContinentDictionary.deployed().then(function(instance){
      dictionary = instance;
      dictionary.addEuropeanCountry('France', 4, 65);
      dictionary.addEuropeanCountry('Russia', 4, 144);
      dictionary.addEuropeanCountry('Poland', 4, 39);
      dictionary.addEuropeanCountry('Taiwan', 2, 23);
      return dictionary.getEuropeanCountry.call('Russia');
    }).then(function(result){
      var name = web3.toAscii(result[0]);
      name = name.replace(/\0/g, '');

      assert.equal('Russia', name, 'Name should be Russia');
      return dictionary.getEuropeanCountry.call('Taiwan');
    }).then(function(result){
      var name = result[0];
      assert.equal('0x0000000000000000000000000000000000000000000000000000000000000000', name, 'Name should be Empty for Taiwan');
    }); 
  });
});
