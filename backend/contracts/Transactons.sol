//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

contract Trasactions {
    uint transactionCount;

    event Transfer(address from, address receiver, uint amount, uint256 timestamp, string message );

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
    }
    TransferStruct[] transactions;

    function addToTheBlockchain(address payable receiver, uint amount, string memory message) public {
        transactionCount += 1;
         transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp));

         emit Transfer(msg.sender, receiver, amount, block.timestamp, message);
    }

    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}