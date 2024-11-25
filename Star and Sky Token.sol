// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; //the contract is designed to work with Solidity version 0.8.0.

// Interface for the Mytoken contract
interface SkyBanktoken {
    function mint(address _target, uint256 _amount)external  ; //It is the interface to mint new tokens
    function Burn(address _target,uint256 _amount) external ;  // It is the function to Burn tokens
    event transfer(address indexed _sender, address indexed _receiver, uint256 _amount) ;  // Function to transfer tokens
    event ownershipTransferred(address indexed _previousOwner, address indexed _newOwner); // Function to transfer ownership.
}


contract MyToken is SkyBanktoken {    //A contract that implements the Mytoken interface

//Token setup with a Name, set a supply and to issue a message to the owner.
    
    string public name;       //The name of the token is adressed publically
    uint256 public supply;               // We set the supply for skytoken to 1000000
    address public Owner = msg.sender;      // This implies that the owner is the message sender 

    constructor (uint256 _setSupply, string memory _setname){               // This is used to set a supply everytime the tokens are deployed.
        supply =_setSupply;     //The initial supply for starbank token must be 5000000 and for skybank must be 1000000
        name = _setname;
    }

// Mapping and setting up so that only the owner can perform restricted actions

    modifier onlyowner() {
        require(msg.sender == Owner, "Only authorized by Owner!");  //it is required that owner must perform the task that states onlyowner
        _;
    }

    mapping (address => uint256 ) public balance; //The Mapping variable is responsible for connecting a user’s address to their token balance.

// Mining and Burn tokens 
 
    function mint(address _target, uint256 _amount) public onlyowner {    
        balance[_target] += _amount;                        // the token balalce can be added or Minted by a selective amount by the user
    }    
    
    function Burn (address _target, uint _amount)public onlyowner{
      
        balance[_target] -= _amount;                        // the balance of the target can be deduced by a selective amount by the user
    }
// transfering Funds from one address to another
    function Transfer(address _sender, address _receiver, uint256 _amount) public onlyowner {
        balance[_sender] -= _amount;                        // The transfer function allows the the owner to transfer the balance from the sender to the reveiver.
        balance[_receiver] += _amount;
    }

    event changeOwner(address _previousOwner, address _newowner); // It is used to change the ownership from one adress to another.

    function transferownership(address _newowner) public onlyowner{
        Owner = _newowner;                      
         emit changeOwner( msg.sender, _newowner); // This is to emit a message that the message sender is now the newowner.
        
    }
}



  