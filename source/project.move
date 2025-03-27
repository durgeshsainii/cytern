module MyModule::Donation {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Campaign has key, store {
        total_donations: u64,
        goal: u64,
    }

    /// Function to initialize a donation campaign with a specific goal.
    public fun initialize_campaign(owner: &signer, goal: u64) {
        let campaign = Campaign {
            total_donations: 0,
            goal,
        };
        move_to(owner, campaign);
    }

    /// Function to donate AptosCoin to a campaign.
    public fun donate(donor: &signer, campaign_owner: address, amount: u64) acquires Campaign {
        let campaign = borrow_global_mut<Campaign>(campaign_owner);
        let donation = coin::withdraw<AptosCoin>(donor, amount);
        coin::deposit<AptosCoin>(campaign_owner, donation);
        campaign.total_donations = campaign.total_donations + amount;
    }
}
 
