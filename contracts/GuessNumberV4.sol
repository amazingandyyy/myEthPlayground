pragma solidity ^0.4.4;

contract GuessNumberV4 {
  uint8[] numArray;
  uint loserCount;
  uint winnerCount;
  string lastWinnerName = '***';
  address winner;
  uint lastWinnerAt;

  struct winnerStruct {
    address guesserAddress;
    string  guesserName;
    uint    timeGuessed;
    uint    guessedNumber;
  }

  mapping(address => winnerStruct) winners;

  function GuessNumberV4(uint8 num1, uint8 num2, uint8 num3) {
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

      winnerStruct memory wnr;
      wnr = winnerStruct({
        guesserAddress: msg.sender,
        guesserName: guesser,
        timeGuessed: now,
        guessedNumber: number
      });
      winners[msg.sender] = wnr;
      return true;
    }
    loserCount += 1;
    return false;
  }

  function totalGuesses() returns (uint){
    return loserCount + winnerCount;
  }

  function getLastWinnerInfo() returns(address, string, uint, uint) {
    if(bytes(winners[winner].guesserName).length != 0){
      return (address(winners[winner].guesserAddress), 
              string(winners[winner].guesserName),
              uint(winners[winner].timeGuessed),
              uint(winners[winner].guessedNumber));
    }
  }

  function checkWinning(address checkAddress) returns(address, string, uint, uint) {
    if(bytes(winners[checkAddress].guesserName).length != 0){
      return (address(winners[checkAddress].guesserAddress), 
              string(winners[checkAddress].guesserName),
              uint(winners[checkAddress].timeGuessed),
              uint(winners[checkAddress].guessedNumber));
    }
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
