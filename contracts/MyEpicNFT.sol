// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    // A counter to track the id of each NFT
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Pass the name of the NFT token and it's symbol
    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my awesome NFT contract!");
    }

    // This runs when the user mints
    function makeAnEpicNFT() public {
        // Get current tokenId (starts at 0)
        uint256 newItemId = _tokenIds.current();

        // Mint NFT and sender to minter
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/914Y");

        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        // Increment the counter for the next minted NFT
        _tokenIds.increment();
    }
}
