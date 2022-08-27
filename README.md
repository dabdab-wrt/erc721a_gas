# ERC721A Gas

# Requirements
* [Foundry](https://book.getfoundry.sh/getting-started/installation)

# Running tests
You may need to run `git submodule init --recursive` first.

```forge test```

## Output from my run:
```
Running 12 tests for test/ERC721AGas.t.sol:ERC721AGas
[PASS] testApprovalA() (gas: 106977)
[PASS] testApprovalS() (gas: 107093)
[PASS] testCheckOwnerA() (gas: 80483)
[PASS] testCheckOwnerS() (gas: 80559)
[PASS] testMintNFTA1() (gas: 79044)
[PASS] testMintNFTA10() (gas: 96442)
[PASS] testMintNFTA100() (gas: 270456)
[PASS] testMintNFTS1() (gas: 79356)
[PASS] testMintNFTS10() (gas: 301916)
[PASS] testMintNFTS100() (gas: 2527583)
[PASS] testTransferA() (gas: 110107)
[PASS] testTransferS() (gas: 90338)
```