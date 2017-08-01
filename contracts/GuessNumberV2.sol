pragma solidity ^0.4.4;

contract GuessNumberV2 {
  uint8[] numArray;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName = '***';

  function GuessNumberV2(uint8 num1, uint8 num2, uint8 num3) {
    numArray = [uint8(num1), num2, num3];
  }

  function getNumArray() returns(uint8[]) {
    return numArray;
  }

  function guess(uint8 number, string guesser) returns(bool){
    if(number == numArray[0] || number == numArray[1] || number == numArray[2]){
      winnerCount += 1;
      lastWinnerName = guesser;
      return true;
    }
    loserCount += 1;
    return false;
  }
  function totalGuesses() returns (uint){
    return loserCount + winnerCount;
  }
  function getLastWinner() returns(string) {
    return lastWinnerName;
  }
}
