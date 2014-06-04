require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "92r8vz8rypsycws4"
Braintree::Configuration.public_key = "589h2784zqq4sfy2"
Braintree::Configuration.private_key = "b06d56f93845cf508ef0c8b9a8f15615"

result = Braintree::MerchantAccount.create(
  :individual => {
    :first_name => "Jane",
    :last_name => "Doe",
    :email => "jane@14ladders.com",
    :phone => "5553334444",
    :date_of_birth => "1981-11-19",
    :ssn => "456-45-4567",
    :address => {
      :street_address => "111 Main St",
      :locality => "Chicago",
      :region => "IL",
      :postal_code => "60622"
    }
  },
  :funding => {
    :destination => Braintree::MerchantAccount::FundingDestination::Bank,
    :email => "funding@blueladders.com",
    :mobile_phone => "5555555555",
    :account_number => "1123581321",
    :routing_number => "071101307"
  },
  :tos_accepted => true,
  :master_merchant_account_id => "2mmr46y8qbhcp7rt",
  :id => "fanfueled"
)

if result.success?
  puts result.merchant.id
else
  p result.errors
end