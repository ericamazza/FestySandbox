require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "92r8vz8rypsycws4"
Braintree::Configuration.public_key = "589h2784zqq4sfy2"
Braintree::Configuration.private_key = "b06d56f93845cf508ef0c8b9a8f15615"

# attempt to create customer with ID that already exists

result = Braintree::Customer.create(
  :id => "21811783",
  :first_name => "Katrina"
)

if result.success?
  puts result.customer.id
else
  p result.errors
end