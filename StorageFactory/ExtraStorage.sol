//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // +5 to faNum;
    //Virtual Override

    function retrieve(string memory _name) public override view returns(uint256) {
        return nameTofavNum[_name]+5;
    }

    function addPerson (string memory _name, uint256 _favNum) public override {
        People memory newPerson = People(_favNum,_name);
        people.push(newPerson);
        nameTofavNum[_name] = _favNum+5;
    }
}
