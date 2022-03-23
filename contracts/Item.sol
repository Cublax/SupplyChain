// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

import "./Ownable.sol";
import "./ItemManager.sol";
contract Item {
    uint public priceInWei;
    uint public index;
    ItemManager parentContract;

    constructor(ItemManager _parentContract, uint _priceInWei, uint _index) public {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _parentContract;
    }

    receive() external payable {
        require(msg.value == priceInWei, "only full payement accepted");
        (bool success, ) = address(parentContract).call{value: msg.value}(abi.encodeWithSignature("triggerPayement(uint256)", index));
        require(success, "The transaction wasn't successful, cancelling");
    }

    fallback() external {}
}
