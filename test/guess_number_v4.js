var GuessNumber = artifacts.require('./GuessNumberV3.sol');

contract('GuessNumber', function(accounts) {
  it("should initialized with three number", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.getNumArray.call();
    }).then(function(result){
      console.log(result.valueOf());
      assert.equal(result.length, 3, "The initialized numArray does no have 3 numbers")
    })
  });
  it("should be 1 total guess after guess once", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.guess(3, 'Andy');
    }).then(function(){
      return machine.totalGuesses.call();
    }).then(function(total){
      assert.equal(total.valueOf(), 1, "Total guess should be 1")
    })
  });
  it("should have Andy's address as lastWinnerAddress", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.getLastWinnerInfo.call();
    }).then(function(result){
      console.log('result address', result);
    })
  });
});
