// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AssetTokenizationPlatform is ERC721URIStorage, Ownable {
    uint256 private tokenIdCounter;

    constructor() ERC721("AssetToken", "AT") {
        tokenIdCounter = 1;
    }

    function tokenizeAsset(address receiver, string memory tokenURI) external onlyOwner returns (uint256) {
        uint256 newTokenId = tokenIdCounter;
        _safeMint(receiver, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenIdCounter++;
        return newTokenId;
    }

    function updateTokenURI(uint256 tokenId, string memory tokenURI) external onlyOwner {
        _setTokenURI(tokenId, tokenURI);
    }

    function burnToken(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }
}