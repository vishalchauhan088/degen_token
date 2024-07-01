# DegenToken


DegenToken is an ERC20-compatible token smart contract written in Solidity. It provides basic token functionalities along with minting, burning, ownership management, and a reward redemption mechanism.

---

## Table of Contents

- [Overview](#overview)
- [Smart Contract](#smart-contract)
- [Features](#features)
- [Deployment](#deployment)
- [Usage](#usage)

---

## Overview

DegenToken (`DGN`) is a decentralized token designed for various use cases within decentralized applications (dApps) and blockchain ecosystems. It supports standard ERC20 operations and additional features to manage token supply and user interactions securely.

---

## Smart Contract

The `DegenToken` contract is implemented in Solidity (`^0.8.18`) and includes the following details:

- **Name**: `degen`
- **Symbol**: `DGN`
- **Decimals**: 18
- **Total Supply**: 100,000 DGN

---

## Features

### Token Operations

- **Transfer**: Allows users to transfer tokens between addresses.
- **Approval**: Enables token holders to approve other addresses to spend tokens on their behalf.
- **Minting**: Only accessible to the contract owner to mint new tokens.
- **Burning**: Allows token holders to burn their own tokens.

### Ownership Management

- **Transfer Ownership**: Enables the current owner to transfer ownership of the contract.

### Reward Redemption

- **Redeem**: Users can redeem tokens for predefined rewards such as `avaxBadge`, `Treasure`, and `amazonCoupon` at a rate of 100 tokens per reward.

---

## Deployment

To deploy the `DegenToken` contract, ensure you have configured your environment with the necessary tools and variables:

1. **Environment Setup**: Set up your development environment with Hardhat or another compatible Ethereum development framework.
2. **Configuration**: Modify the `hardhat.config.js` (or equivalent) to include network settings and deployment parameters.
3. **Deployment Command**: Use `npx hardhat run scripts/deploy.js --network [network_name]` to deploy the contract to your desired network.

---

## Usage

### Interacting with DegenToken

1. **Token Transfers**:
   - Use `transfer(address _to, uint256 _value)` to send tokens to another address.

2. **Approvals and Allowances**:
   - Use `approve(address _spender, uint256 _value)` to approve an address to spend tokens on your behalf.
   - Check allowances using `allowance(address _owner, address _spender)`.

3. **Minting and Burning**:
   - Only the contract owner can mint new tokens using `mint(address _to, uint256 _amount)`.
   - Burn tokens using `burn(uint256 _amount)`.

4. **Ownership Management**:
   - Transfer ownership of the contract using `transferOwnership(address _newOwner)`.

5. **Reward Redemption**:
   - Use `redeem(uint256 _rewardIndex)` to redeem tokens for predefined rewards.

---

## Contributing

We welcome contributions to enhance `DegenToken`! To contribute:

- Fork the repository and create a new branch.
- Make your changes and submit a pull request.
- Follow the coding standards and guidelines outlined in the repository.

---



