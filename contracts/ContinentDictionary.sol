pragma solidity ^0.4.4;

contract ContinentDictionary {
  enum continents {Africa,Antartica,Asia,Australia,Europe,North_America, South_America}

  struct country {
    bytes32     name;
    continents  continent;
    uint16      populationInMillion;
  }

  country[] europeanCountries; // like JSON objest array

  function ContinentDictionary() {
    // constructor
  }

  function addEuropeanCountry(bytes32 name, uint8 continentIndex, uint16 population) returns(bool) {
    // make sure the country is in the continent Europe
    if(continentIndex != uint8(continents.Europe)) return false; 

    country memory ctry; // convert to memeory, since country is default to be in storage

    // way 1: 
      // ctry = country(name, continents(continentIndex), population);
    // way 2:
    ctry = country({name: name, continent: continents(continentIndex), populationInMillion: population});

    // push to the array;
    europeanCountries.push(ctry);
    return true;
    
  }

  function getEuropeanCountry(bytes32 name) returns(bytes32, uint8, uint16) {
    
    for(uint8 i = 0; i < europeanCountries.length; i++){
      if(name == europeanCountries[i].name){
        return(bytes32(europeanCountries[i].name),
               uint8(europeanCountries[i].continent),
               uint16(europeanCountries[i].populationInMillion));
      }
    }
  }
  
  // get the value at specified index
  function getContinent(uint8 arg) returns (string){
    if(arg == uint8(continents.Africa)) return "Africa";
    if(arg == uint8(continents.Antartica)) return "Antartica";
    if(arg == uint8(continents.Asia)) return "Asia";
    if(arg == uint8(continents.Australia)) return "Australia";
    if(arg == uint8(continents.Europe)) return "Europe";
    if(arg == uint8(continents.North_America)) return "North America";
    if(arg == uint8(continents.South_America)) return "South America";
  }
}
