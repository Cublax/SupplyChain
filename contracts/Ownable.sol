// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
contract Ownable {

address public _owner;
constructor () internal { 
    _owner = msg.sender;
}
/**
* @dev Throws if called by any account other than the owner. */
modifier onlyOwner() {
require(isOwner(), "Ownable: caller is not the owner"); _;
}

/**
* @dev Returns true if the caller is the current owner. */
function isOwner() public view returns (bool) { 
    return (msg.sender == _owner);
} 
}