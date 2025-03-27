# Aptos Move Smart Contract: Donation Module

## Overview
This Move smart contract implements a simple donation system on the Aptos blockchain. Users can create donation campaigns and receive contributions in AptosCoin.

## Features
- **Initialize a Campaign**: A user can create a donation campaign with a specific fundraising goal.
- **Donate**: Other users can contribute AptosCoin to an existing campaign.

## Smart Contract Functions
### 1. `initialize_campaign(owner: &signer, goal: u64)`
- Creates a new donation campaign.
- Stores the campaign under the owner’s address.
- Initializes `total_donations` to 0.

### 2. `donate(donor: &signer, campaign_owner: address, amount: u64)`
- Allows a donor to contribute AptosCoin to an existing campaign.
- Withdraws the specified amount from the donor and deposits it into the campaign owner's address.
- Updates the total donations received.

## Prerequisites
- Aptos CLI installed.
- An Aptos account with sufficient test funds.

## Deployment Instructions
1. Compile the contract using the Aptos CLI:
   ```sh
   aptos move compile
   ```
2. Publish the contract to the Aptos blockchain:
   ```sh
   aptos move publish --profile default
   ```
3. Interact with the contract using Aptos CLI or a frontend.

## Notes
- Ensure that donors have enough AptosCoin in their wallet before donating.
- The contract does not enforce a maximum donation limit beyond the user's balance.

## License
This project is open-source and available under the MIT License.

Deployment Address:

