// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

    mapping(uint256 => string) private items; 

    constructor() ERC20("Degen", "DGN") {}

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }

     function addItem(uint256 itemId, string memory itemDetails) public {
        require(
            bytes(items[itemId]).length == 0,
            "Item already exists"
        );

        items[itemId] = itemDetails;
    }

    function redeemItem(uint256 itemId) public payable  {
        require(
            bytes(items[itemId]).length > 0,
            "Item does not exist"
        );

        require(
            balanceOf(msg.sender) > 0,
            "Insufficient balance"
        );

        _burn(msg.sender, 100);
        // Perform the redemption logic here
        // For example, transfer the item to the player
    }

     function getItemDetails(uint256 itemId) public view returns (string memory) {
        return items[itemId];
    }

}
