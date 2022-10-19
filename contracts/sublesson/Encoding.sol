//SPDX-License-Identifier: MIT

    //this is to learn about encoding , what goes behind the scenes of abi , binary data etc
    //https://docs.soliditylang.org/en/latest/cheatsheet.html?highlight=encodewithsignature
    //// https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837

    pragma solidity ^0.8.7;

    contract Encoding{
        //in this function , abi.encodepacked converts them into bytes and concatenates them , then get
        //turned back to a string by the typecast ie "string()"
        function combineStrings() public pure returns(string memory){
            return string(abi.encodePacked("sup rio" , "this is me"));
        }
         //in solidity 0.8.12 + concatenation is done by
         //string.concat(stringA , stringB)
    
        //this returns how computer understands and sees the number 1
        //that is in bytes
         function encodeNumber() public pure returns(bytes memory){
             bytes memory number = abi.encode(1);
             return number;
         }
    
    
         //this returns how computer understands and sees words or strings
        //that is in bytes
         function encodeString()public pure returns(bytes memory){
             bytes memory word = abi.encode("some string");
             return word;
         }
    
         //notice the weird 0s in the beginning..they dont really do nothing but take up space..
         //thats where abi.encodePacked comes in
    
         function encodeStringPacked()public pure returns(bytes memory){
             bytes memory someString = abi.encodePacked("some string");
             return someString;
         }
        
        //decodes encoded data to string
         function decodeString() public pure returns (string memory){
             string memory someString = abi.decode(encodeString() , (string));
             return  someString;
         }
        
         function multiEncode() public pure returns(bytes memory){
             bytes memory someString = abi.encode("some string" , "thats right my gee");
             return someString;
         }
    
         function multiDecode() public pure returns(string memory , string memory){
             (string memory someString , string memory someOtherString) = abi.decode(multiEncode() , (string , string));
             return(someString , someOtherString); 
         }
    
         function multiEncodePacked() public pure returns(bytes memory){
             bytes memory someString = abi.encodePacked("some string" , "other one");
             return someString;
         }
    
         function multiStringCastPacked() public pure returns(string memory){
             string memory someString = string(multiEncodePacked());
             return someString;
         }
    
         //to call a smart contract function we ened the abi and contract address
         //we can get either the normal english written abi(normal one we can understand) or the byte abi
         //furthermore we dont really need all the english written one
         // just the part w the function we want to call
    
          // Solidity has some more "low-level" keywords, namely "staticcall" and "call". 
          //We've used call in the past, but
        // haven't really explained what was going on. There is also "send"... 
        //but basically forget about send.
    
        // call: How we call functions to change the state of the blockchain.
        // staticcall: This is how (at a low level) we do our "view" or "pure" function calls,
        // and potentially don't change the blockchain state.
    
        function withdraw(address recentWinner) public{
            (bool success , ) = recentWinner.call{value: address(this).balance}("");
            require(success , "Transfer Failed");
        }
    
            // Remember this?
        // - In our {} we were able to pass specific fields of a transaction, like value.
        // - In our () we were able to pass data in order to call a specific function -
        // but there was no function we wanted to call!
        // We only sent ETH, so we didn't need to call a function!
        // If we want to call a function, or send any data, we'd do it in these parathesis!
    
        // Let's look at another contract to explain this more...
    
         
        
        
    }