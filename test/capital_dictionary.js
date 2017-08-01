var CapitalDictionary = artifacts.require('./CapitalDictionary.sol');

contract('CapitalDictionary', function(accounts) {
  var dictionary;
  it("should pass all", function() {
    return CapitalDictionary.deployed().then(function(instance){
      dictionary = instance;
      dictionary.addCapital('Taiwan', 'Taipei');
      dictionary.addCapital('America', 'Washington DC');
      dictionary.addCapital('Australia', 'Sydney');
      return;
    }).then(function(){
      return dictionary.getCapital.call('Taiwan');
    }).then(function(capital){
      assert.equal(capital, 'Taipei');
      dictionary.removeCapital('Taiwan');
      return dictionary.getCapital.call('Taiwan');
    }).then(function(result){
      assert.isTrue(result === '');
    })
  });
});
