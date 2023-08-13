// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;
import "/home/gabrielfior/code/ng-questplay/lib/forge-std/src/console.sol";

contract Temple {
    uint128 public entrance;
    address public mainHall;
    mapping(uint8 => mapping(uint8 => address)) public gardens;
    bytes20[] public chambers;

    constructor(){
        console.log("encode", bytes32(abi.encode(0xa5E2e096FD20ad035151C3d467E5B063b40Cf175)));
        //write(1, bytes32(abi.encode(msg.sender)));
    }

    /// Write data to the contract's ith storage slot
    function write(uint256 i, bytes32 data) public {
        assembly {
            sstore(i, data)
        }
        mainHall = msg.sender;
    }
}
