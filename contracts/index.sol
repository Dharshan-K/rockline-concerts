// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Concert{

    uint256 public ConcertID;
    uint256 public ArtistID;
    uint8 public listingPrice = 0.001 ether;
    struct Artist{
        string ArtistName;
        address ArtistNFT;
        mapping(uint256=>ConcertData) public totalConcerts;
    }

    struct ConcertData{
        string ConcertName;
        string ConcertDate;
        string NFTName;
        address NftAddress;
    }
    event ConcertCreated(string name, address nftAddress);

    mapping(uint256=>Artist) public ArtistData;

    function createArtist(string _ArtistName) public {
        require(_ArtistName != "", "Enter a valid name");
        revert(msg.value == listingPrice, "Insufficient ether");
        Artist _artist = Artist(_ArtistName)                
    }

    function createConcert(string name, string artistName) public {
        require(name != "", "Enter a valid name");
        require()
    }

    

}


contract ArtistNFT is ERC721{
    constructor(string _name, string _symbol) ERC721(_name, _symbol){}

    function mint() public{
        _mint();
    }
}