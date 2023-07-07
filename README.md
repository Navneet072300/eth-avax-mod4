# eth-avax-mod4
The program provided is an example of a smart contract written in Solidity.This program is an degen gaming program in which the contract owner will only able to mint tokens to a provided address. Players can able to burn and transfer tokens and they can also redeem items in exchange of their tokens.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain and Hardhat network is used like ERC20 and openzeppelin. The contract has a several function like onlyowner that only the owner can mint the token, mint to add some token, burn to withdraw som tokens and transfer to transfer from one address to another, additems to add items for token exchange, redeemItem to redeem itmes in echange of tokens.

## Getting Started

### Executing program

To run this program, we have used Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., gaming.sol). Copy and paste the following code into the file:

```javascript
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



```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile token.sol" button.
Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "token" contract from the dropdown menu, and then click on the "Deploy" button.
Once the contract is deployed, mint some amount of token, check the balance using getBalance, name of contract from name and symbol from symbol. You can transfer token from one player to another using trnsfer and burn by using burn function, you can also add items to exchange with token using addItem and reedem items using redeemItems. You can also see the the details of items using getItemDetails.
## Authors

Navneet Shahi 



## License

This project is licensed under the MIT License. You are free to modify and distribute the code for personal and educational purposes.
