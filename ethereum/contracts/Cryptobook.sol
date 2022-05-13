//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ContractFactory{
    mapping(address => address) public ownerToContract;

    function createContract(string memory _telegram, string memory _discord) public{
        Contact contact = new Contact(_telegram, _discord);
        ownerToContract[msg.sender] = address(contact);
    }
}

contract Contact{
    address public owner;
    string public telegram;
    string public discord;
    string public desc;

    constructor (string memory _telegram, string memory _discord){
        owner = msg.sender;
        telegram = _telegram;
        discord = _discord;
    }

    modifier onlyOwner{
        require(owner == msg.sender, "Not an owner");
        _;
    }

    function setTelegram(string memory _telegram) public onlyOwner {
        telegram = _telegram;
    }

    function setDiscord(string memory _discord) public onlyOwner {
        discord = _discord;
    }

    function setDesc(string memory _desk) public onlyOwner {
        desc = _desk;
    }

}