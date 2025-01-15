## Usage

### Install

```shell
$ forge install
```

### Test on mainet fork

Each integration's implementation tests may be designed for different blockchain networks. Ensure you provide the correct chain RPC endpoint for accurate testing.

```shell
$ forge test test/TestfileName.t.sol --fork-url $BASE_RPC_URL -vvvv

for example

$ forge test test/MorphoFlashloan.t.sol --fork-url $BASE_RPC_URL -vvvv

```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```
