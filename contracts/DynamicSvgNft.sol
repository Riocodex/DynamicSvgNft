//SPDX-License-Identifier: MIT

pragma solidity 0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "base64-sol/base64.sol" 

contract DynamicSvgNft{
    
    uint256 private s_tokenCounter;
    string private i_lowImageUri;
    string private i_highImageUri;
    string private constant base64EncodedSvgPrefix = "data:image/svg+xml;base64,"
    AggregatorV3Interface internal immutable i_priceFeed;
    mapping(uint256 => uint256) public s_tokenIdToHighValue

    constructor(
        address priceFeedAdress ,
         string memory lowSvg ,
          string memory highSvg
    ) ERC721 ("Dynamic SVG NFT" , "DSN"){
        s_tokenCounter = 0;
        i_lowImageUri = svgToImageURI(lowSvg);
        i_highImageUri = svgToImageURI(highSvg);
        i_priceFeed = AggregatorV3Interface(priceFeedAdress);
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))))
        return string(abi.encodePacked(base64EncodedSvgPrefix , svgBase64Encoded));
    }

    function mintNft(int256 highValue) public {
    _safeMint(msg.sender , s_tokenCounter);
    s_tokenCounter = s_tokenCounter + 1;

    }

    function _baseURI() internal pure override returns (string memory){
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "URI Query for nonexistent token");
        // string memory imageUri = "hi!";
        (, int256, , , ) = i_priceFeed.latestRoundData();
        string memory imageURI  = i_lowImageURI;
        if(price >= ??){
            imageURI = i_highImageUri;
        }
        return
        string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that changes based on the Chainlink Feed", ',
                            '"attributes": [{"trait_type": "coolness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
