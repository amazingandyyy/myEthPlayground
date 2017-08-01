var GuessNumber = artifacts.require('./GuessNumberV2.sol');

contract('GuessNumber', function(accounts) {
  it("should initialized with three number", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.getNumArray.call();
    }).then(function(array){
      assert.equal(array.length, 3, "The initialized numArray does no have 3 numbers")
    })
  });
  it("should initialized with 0 total guess", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.totalGuesses.call();
    }).then(function(total){
      assert.equal(total.valueOf(), 0, "Total guess should be 0")
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
  it("should have Andy as lastWinnerName", function() {
    var machine;
    return GuessNumber.deployed().then(function(instance){
      machine = instance;
      return machine.getLastWinner.call();
    }).then(function(winner){
      assert.equal(winner.valueOf(), 'Andy', "lastWinner should be Andy")
    })
  });
});
