pragma solidity ^0.4.4;

contract GuessNumberV3 {
  uint8[] numArray;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName = '***';
  uint lastWinnerAt;
  address winner;

  function GuessNumberV3(uint8 num1, uint8 num2, uint8 num3) {
    numArray = [uint8(num1), num2, num3];
  }

  function getNumArray() returns(uint8[]) {
    return numArray;
  }

  function guess(uint8 number, string guesser) returns(bool){
    if(number == numArray[0] || number == numArray[1] || number == numArray[2]){
      winnerCount += 1;
      lastWinnerName = guesser;
      lastWinnerAt = now;
      winner = msg.sender;
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

  function getLastWinnerAddress() returns(address) {
    return winner;
  }

  function getTime() returns (uint){
    uint  tim = now;
    return tim;
  }

  function daysSinceLastWinning() returns (uint){
    if(lastWinnerAt == 0){
      return 0;
    }
    uint diff = now - lastWinnerAt;
    uint  tim = (diff - diff%60%60%24)/(60*60*24);
    return tim;
  }

  function hoursSinceLastWinning() returns (uint){
    if(lastWinnerAt == 0){
      return 0;
    }
    uint diff = now - lastWinnerAt;
    uint  tim = (diff - diff%60%60)/(60*60);
    return tim;
  }

  function minutesSinceLastWinning() returns (uint){
    if(lastWinnerAt == 0){
      return 0;
    }
    uint diff = now - lastWinnerAt;
    uint  tim = (diff - diff%60)/(60);
    return tim;
  }
  function secondsSinceLastWinning() returns (uint){
    if(lastWinnerAt == 0){
      return 0;
    }
    uint diff = now - lastWinnerAt;
    uint  tim = diff;
    return tim;
  }

}
