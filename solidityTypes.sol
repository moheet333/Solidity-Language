// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; //0.8.17 latest
// ^0.8.7 , >=0.8.7 <0.9.0

contract SimpleStorage {
    // boolean, uint, int, address, bytes, string
    bool hasFavNum = true;
    uint256 favNum = 3;
    int32 HatedNum = 1;
    string favWord = "Anime";
    address myAddress = 0xAaD4e106f05AADf25f8e1C4B321896d445FCdbA8;
    bytes32 favBytes = "cat"; // )x432141... format
    // uint low 8 high 256
}
