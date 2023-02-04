// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Concert{

    uint256 public ConcertID;
    uint256 public ArtistID;
    uint256 public ArtistListingPrice = 0.001 ether;
    uint256 public ConcertListingPrice = 0.001 ether;
    struct Artist{
        string ArtistName;
        address ArtistNFT;
    }

    struct ConcertData{
        string ConcertName;
        string ConcertDate;
        string NFTName;
        address NftAddress;
    }
    event ConcertCreated(string name, address nftAddress);

    mapping(uint256=>Artist) public ArtistData;

    function createArtist(string memory _ArtistName,string memory _name, string memory _symbol, uint256 _maxsupply) public payable {
        require(msg.value == ArtistListingPrice, "Insufficient ether");
        address artistAddress = createNFT( _name,  _symbol, _maxsupply);
        Artist memory _artist = Artist(_ArtistName, artistAddress);   
        ArtistData[ArtistID] = _artist;
        ArtistID++;           
    }

    function createConcert(string memory name, string memory artistName) public payable {
        require(msg.value == ConcertListingPrice, "Paid ether is not sufficient");
    }

    function createNFT(string memory _name, string memory _symbol, uint256 _maxsupply) public returns(address){
        ArtistNFT nftContract = new ArtistNFT(_name,_symbol,_maxsupply);
        return address(nftContract);
    }

    

}


contract ArtistNFT is ERC721{
    uint256 public tokenID=1;
    uint256 public immutable maxsupply;
    constructor(string memory _name, string memory _symbol, uint256 _maxsupply) ERC721(_name, _symbol){
        maxsupply = _maxsupply;
    }

    function mint(uint256 _ticketPrice) public{
        _mint(msg.sender, tokenID);
        tokenID++;
    }
}


// revert(msg.value==_ticketPrice, "Pay the required price");