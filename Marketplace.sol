// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    struct item {
        uint256 id;
        address payable seller;
        string name;
        uint256 price;
        bool isSold;
    }

    uint256 public itemCount = 0;
    mapping(uint256 => item) public items;

    event ItemListed(uint256 indexed itemId, address indexed seller, string name, uint256 price);
    event ItemPurchased(uint256 indexed itemId, address indexed buyer, address indexed seller, uint256 price);

    function listItem(string memory _name, uint256 _price) external {
        require(bytes(_name).length > 0, "Item name is required");
        require(_price > 0, "Price should be greater than 0");

        itemCount++;
        items[itemCount] = item(itemCount, payable(msg.sender), _name, _price, false);

        emit ItemListed(itemCount, msg.sender, _name, _price);
    }

    function buyItem(uint256 _itemId) external payable {
        item storage selectedItem = items[_itemId];
        require(selectedItem.id == _itemId, "Item does not exist");
        require(msg.value == selectedItem.price, "Incorrect Ether sent");
        require(!selectedItem.isSold, "Item already sold");
        require(msg.sender != selectedItem.seller, "Seller cannot buy their own item");

        selectedItem.isSold = true;
        selectedItem.seller.transfer(msg.value);

        emit ItemPurchased(_itemId, msg.sender, selectedItem.seller, selectedItem.price);
    }
}
