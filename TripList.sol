// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract TripList {

    address owner;
    string[] items;

    constructor() public {
        //owner = msg.sender;
    }

    //modifier onlyOwner() {
    //    require(msg.sender == owner, "Only the owner can modify this");
    //    _;
    //}

    function addItem(string memory item) public returns(string memory, uint) {
        items.push(item);
        uint itemIndex = items.length - 1;
        emit ItemAdded(msg.sender, itemIndex);
        string memory message = "your newly added item is at index: ";
        return (message, itemIndex);
    }
    function itemsLength() public view returns(string memory, uint) {
        string memory lengthMessage = "The List is this long: ";
        return (lengthMessage, items.length);
    }

    function viewItem(uint index) private view /*onlyOwner*/ returns (string memory) {
        require (index < items.length, "No item exists at that index");
        return items[index];
    }

    event ItemAdded(address from, uint index);
}