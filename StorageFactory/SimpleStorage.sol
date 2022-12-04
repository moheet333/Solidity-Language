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
    //calldata, memory, storage
    
    // calldata(cannot modify) and memory(can modify) exists temporarily storage(permanent modifyable) is default
    function addPerson (string memory _name, uint256 _favNum) public virtual {
        People memory newPerson = People(_favNum,_name);
        people.push(newPerson);
        nameTofavNum[_name] = _favNum;
    }

    function retrieve(string memory _name) public virtual view returns(uint256) {
        return nameTofavNum[_name];
    }

    //mapping
    mapping(string => uint256) public nameTofavNum;
    // value stored above
}
