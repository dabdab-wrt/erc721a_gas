# ERC721A Gas
Comparison of gas costs between ERC721A and solmate's ERC721.

# Results
These results were computed from the raw test output. The spreadsheet can be found [here](https://docs.google.com/spreadsheets/d/1rr6eCVoSaBk2x66aYsLcko9T2PoTF6dxR85UtryGA00/).

ERC721A outperforms ERC721 when doing batch minting, saving ~70% in gas costs in a batch of 10 mints, and up to ~90% in gas in a batch of 100. 

However, it costs a lot more for almost any other operation. In particular, it costs **182%** more to transfer an ERC721A compared to an ERC721.

## Savings and extra costs of using ERC721A
||ERC721 - solmate|ERC721A|ERC721A Savings per mint|% Savings|
|-|-|-|-|-|
|Gas Per Mint 1|79,356|79,044|312|0.39%|
|Gas Per Mint 10|30,192|9,644|20,547|68.06%|
|Gas Per Mint 100|25,276|2,705|22,571|89.30%|

||ERC721 - solmate|ERC721A|ERC721A Extra Cost per txn|% Extra Cost|
|-|-|-|-|-|
|Gas Per Approval|27,737|27,933|196|0.71%|
|Gas Per Ownership Check|1,203|1,439|236|19.62%|
|Gas Per Transfer|10,982|31,063|20,081|182.85%|

---
# Running tests
## Requirements
* [Foundry](https://book.getfoundry.sh/getting-started/installation)

You may need to run `git submodule init --recursive` first.

```forge test```

## Raw test output:
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
