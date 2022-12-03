// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    //Struct
    People public person = People({favNum: 3, name: "moheet"});
    struct People{
        uint256 favNum;
        string name;
    }
    
    //Array
    People[] public people; //dynamic array

    function addPerson (string memory _name, uint256 _favNum) public {
        People memory newPerson = People(_favNum,_name);
        people.push(newPerson);
    }
}
