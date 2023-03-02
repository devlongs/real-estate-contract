//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RealEstate is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

   // Define the constructor function that sets the name and symbol of the token
constructor() ERC721("Real Estate", "REAL") {}

// Define the mint function, which mints a new token and returns its ID
function mint(string memory tokenURI) public returns (uint256) {
    // Increment the tokenIds counter
    _tokenIds.increment();

    // Get the current value of the tokenIds counter
    uint256 newItemId = _tokenIds.current();

    // Mint a new token to the address that called this function
    _mint(msg.sender, newItemId);

    // Set the URI for the new token
    _setTokenURI(newItemId, tokenURI);

    // Return the ID of the new token
    return newItemId;
}

// Define the totalSupply function, which returns the current value of the tokenIds counter
function totalSupply() public view returns (uint256) {
    return _tokenIds.current();
}

}