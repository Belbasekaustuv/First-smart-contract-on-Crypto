Software Overview:
The SkyBanktoken Contract is a simple contract created on the Remix platform of Ethereum blockchain. This contract allows users to track balances, mint and burn tokens, transfer ownership of the token and transfer tokens from one address to another. The StarBanktoken Contract has the same code as well as the same function as SkyBanktoken. Despite having the same code and function we require different codes for both to exchange the two tokens by using a DEX (Decentralized Exchange). We use .sol extension to save this code as a part of the Solidity ecosystem.
Software Development:

 
				
The Pragma solidity ^0.8.0 represents the version of the solidity in which the code is run. 
The Contract that we created is named BankToken as a reference for the token which is created for Star bank and Sky bank. 
The Interface gives an overview of the Contract’s Core events, which are Transfer (of tokens), Ownership transfer and has mint and burn functions. 

  
 
Initially, the name of the token is added by using the variable ‘String’ which is set publicly, so that the name becomes public to everyone in the Blockchain. Similarly, we setup the supply of the token.
Now, we add the address variable to represent the address of the owner who holds the Token. 
address public Owner = msg.sender; 
This code represents that the owner is the message sender.
Furthermore, a constructor is used so that the user must input the supply and the name of the token. The initial supply for skybank is 1000000 whereas the supply for Starbank is 5000000.

 
The modifier here checks that the message sender, i.e., the address that called this function, is equal to Owner. Then it checks whether the caller is the owner or not; if anyone except the owner tries deploying, it reverts the transaction and prints the message "Only authorized by Owner!".
If the caller is the owner, then the _ symbol instructs Solidity to execute the function.
Similarly, Mapping allows the contract to keep track of the balance of the tokens, assigned to each address. Since this mapping is public, this means any external account could look up the balance of any address.
 

 We use the mint or burn function to add or deduct the token balance.  
We also add the balance[_target], which is the balance of the target which increases or decreases by the amount input by the user. 

 

The code provides the users with two functions, First the ‘Transfer’ function enables the owner to transfer tokens between an address couple, subtracting a given amount from the sender’s balance and adding that to the receiver’s balance.
The second one is the `transfer ownership` function; this enables the owner to transfer the ownership of the contract to a new address. The two above actions are restricted to the owner of the contract by using the modifier ‘only owner’.
Testing:

 
We compile the code by pressing the green play button on the top of the screen and the code is compiled, in this case there is no error shown which means we could move forward to generating the output. If there are any errors in the code, then the compiler sends a red warning or a yellow warning sign. 

 
We Deploy the code by clicking on the Run Transaction button, which is circled in green. when inside the Deployment we add the initial supply once for starbank and once for skybank respectively. 

 



OUTPUTS: 

 
 
As we can see the initial supply is set to 1000000 for ‘Skybank’, which can be seen by clicking the supply and name tabs respectively. Similarly, we minted 30000 coins that can be seen by clicking the balance tab. Furthermore, the owner of the token can be viewed by clicking the Owner section.


 
We tested the transfer function by transferring 20000 coins from the owner’s address to another address. When viewing the balance of the other address we can see it has 20000 coins. The burn function is used to reduce the coins.
 
The ownership can also be transferred from one address to another. In this case we transferred the ownership to a new address which is 0xC3Ba… and in the owner tab we can see that it is set as the new owner.  

 



Challenges and Solutions:
A few challenges were faced when completing the contract.

1.	Security challenges:
Anyone in the system could transfer the tokens to anyone without any restrictions, this was solved by using the Only Owner modifier. 


2.	Constructor Error:
 
The constructor gave us an error when setting up name, this was fixed by using the ‘memory’ variable which allows Remix to store names onto its memory. 
 

Conclusion:
The contract provides basic functionality of a token system through the implementation of minting, burning, transferring of tokens, and management of token ownership through secure administrative control. However, a lot of things need to be changed in this contract to make production ready. The contract needs enhanced security measures, proper validation checks, and enhancement in error handling.
