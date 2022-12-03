// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    uint256 public favNum; // intialized to 0
    // public, private, internal, external
    // default visibility is internal
    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    function retrieve() public view returns(uint256) {
        return favNum;
    } // view and pure functions doesn't spend gas
    // view disallows modifications

    function add() public pure returns(uint256) {
        return (1+1);
    }// no view on blockchain.
}
