pragma solidity ^0.4.4;

contract CapitalDictionary {

  mapping(string => string) capitals;
  // no out of box method to get the length of mapping
  // the key of mapping are stored as hash instead the key value itself
    // key can not be mapping type
    // value can be any types

  function addCapital(string country, string capital) {
    capitals[country] = capital;
  }

  function getCapital(string country) returns (string capital) {
    capital = capitals[country];
  }

  function removeCapital(string country) {
    delete(capitals[country]);
  }

  function CapitalDictionary() {
    // constructor
  }
}
