// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { System } from "@latticexyz/world/src/System.sol";
import { addressToEntityKey } from "../addressToEntityKey.sol";
import { Role } from "../codegen/index.sol";

contract MapSystem is System {
  function distance(uint32 fromX, uint32 fromY, uint32 toX, uint32 toY) internal pure returns (uint32) {
    uint32 deltaX = fromX > toX ? fromX - toX : toX - fromX;
    uint32 deltaY = fromY > toY ? fromY - toY : toY - fromY;
    return deltaX + deltaY;
  }

  function genRole(uint32 _age, uint32 _karma, string memory _name, string memory _description) public {
    bytes32 role = addressToEntityKey(address(_msgSender()));
    Role.set(role, _age, 100, _karma, _name, _description);
  }
}
