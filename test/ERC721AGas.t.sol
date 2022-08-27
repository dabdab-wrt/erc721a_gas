// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "erc721a/ERC721A.sol";
import "solmate/tokens/ERC721.sol";

contract MyNFTA is ERC721A("A", "A") {
  function mint(uint256 quantity) external {
    _mint(msg.sender, quantity);
  }
}

contract MyNFTS is ERC721("S", "S") {
  
  uint256 public supply;

  function mint(uint256 quantity) external {
    uint256 currentSupply = supply;
    uint256 targetSupply = currentSupply + quantity;
    for (uint256 i = currentSupply; i < targetSupply;) {
      _mint(msg.sender, i);
      unchecked {
        ++i;
      }
    }
    supply = targetSupply;
  }

  function tokenURI(uint256 id) public view override returns (string memory) {
    return "";
  }
}

contract ERC721AGas is Test {
  MyNFTA internal erc721a;
  MyNFTS internal erc721;
  address internal minter;
  address internal other;

  function setUp() public {
    erc721a = new MyNFTA();
    erc721 = new MyNFTS();
    minter = 0x939C8d89EBC11fA45e576215E2353673AD0bA18A;
    other = 0xFf6c307226343fCF96AF2f6B5B05f63F717e68cb;
  }

  // --------------------- Minting --------------------- //
  function testMintNFTA1() public {
    vm.prank(minter);
    erc721a.mint(1);
  }

  function testMintNFTS1() public {
    vm.prank(minter);
    erc721.mint(1);
  }

  function testMintNFTA10() public {
    vm.prank(minter);
    erc721a.mint(10);
  }

  function testMintNFTS10() public {
    vm.prank(minter);
    erc721.mint(10);
  }

  function testMintNFTA100() public {
    vm.prank(minter);
    erc721a.mint(100);
  }

  function testMintNFTS100() public {
    vm.prank(minter);
    erc721.mint(100);
  }

  // --------------------- Check Owner --------------------- //
  function testCheckOwnerA() public {
    vm.prank(minter);
    erc721a.mint(1);
    assertEq(minter, erc721a.ownerOf(0));
  }
  
  function testCheckOwnerS() public {
    vm.prank(minter);
    erc721.mint(1);
    assertEq(minter, erc721.ownerOf(0));
  }

  // --------------------- Transfer --------------------- //
  function testTransferA() public {
    vm.startPrank(minter);
    erc721a.mint(1);
    erc721a.transferFrom(minter, other, 0);
    vm.stopPrank();
  }
  function testTransferS() public {
    vm.startPrank(minter);
    erc721.mint(1);
    erc721.transferFrom(minter, other, 0);
    vm.stopPrank();
  }

  // --------------------- Approval --------------------- //
  function testApprovalA() public {
    vm.startPrank(minter);
    erc721a.mint(1);
    erc721a.approve(other, 0);
    vm.stopPrank();
  }
  function testApprovalS() public {
    vm.startPrank(minter);
    erc721.mint(1);
    erc721.approve(other, 0);
    vm.stopPrank();
  }
}
