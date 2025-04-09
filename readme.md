# Smart Contract Wallet

This contract is designed to manage funds using the Ethereum blockchain.

## Features 🚀

- **Ownership**: The contract allows setting and changing the owner with guardian confirmations.
- **Allowance**: Owners can set allowances for specific addresses, enabling controlled fund transfers.
- **Guardians**: Guardians can propose and confirm new owners.
- **Fund Transfer**: Send funds with payloads to other addresses.

## Contract Details 📝

### State Variables

- `owner`: The current owner of the contract.
- `allowance`: Mapping of addresses to their respective allowances.
- `isAllowedToSend`: Mapping indicating if an address is allowed to send funds.
- `guardians`: Mapping of guardian addresses.
- `nextOwner`: The proposed new owner.
- `nextOwnerGuardianVotedBool`: Nested mapping tracking guardian votes for new owners.
- `guardiansResetCount`: Counter for guardian confirmations.
- `confirmationsFromGuardiansForRest`: Constant for required guardian confirmations.

### Functions

- `setGuardian(address _guardian, bool _isGuardian)`: Set or remove a guardian.
- `proposeNewOwner(address payable _newOwner)`: Guardians propose a new owner.
- `setAllowance(address _for, uint _amount)`: Set allowance for an address.
- `transfer(address payable _to, uint _amount, bytes memory _payload)`: Transfer funds with optional payload.
- `getBalance()`: Returns the current balance of the contract.
- `receive()`: Allows the contract to receive Ether.
- `fallback()`: Handles calls with no data or unknown functions.

## Usage Guide 📖

1. **Deploy the Contract**: Deploy the contract on the Ethereum blockchain using a compatible wallet or development environment.
2. **Set Guardians**: Use `setGuardian` to designate trusted addresses as guardians.
3. **Propose New Owner**: Guardians can propose a new owner using `proposeNewOwner`.
4. **Manage Allowances**: The owner can set allowances for specific addresses using `setAllowance`.
5. **Transfer Funds**: Use `transfer` to send Ether with optional data payloads.
6. **Check Balance**: Use `getBalance` to view the contract's current Ether balance.

## Testing
![image](https://github.com/user-attachments/assets/ab981b52-15b5-48ef-ac0e-d84abff7d173)
