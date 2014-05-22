require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "92r8vz8rypsycws4"
Braintree::Configuration.public_key = "589h2784zqq4sfy2"
Braintree::Configuration.private_key = "b06d56f93845cf508ef0c8b9a8f15615"

# bare bones example of how to create a transaction

# result = Braintree::Transaction.sale(
#   :amount => "123.00",
#   :credit_card => {
#     :number => "4111 1111 1111 1111",
#     :expiration_month => "05",
#     :expiration_year => "19",
#     :cvv => "123"
#   },
#   :billing => {
#     :street_address => "1 E Main St",
#     :extended_address => "Suite 403",
#     :locality => "Chicago",
#     :region => "Illinois",
#     :postal_code => "60622",
#   },
#   :options => {
#     :submit_for_settlement => true
#   }
# )

# if result.success?
#   puts "Transaction ID: #{result.transaction.id}"
#   # status will be authorized or submitted_for_settlement
#   puts "Transaction Status: #{result.transaction.status}"
# else
#   puts "Message: #{result.message}"
#   if result.transaction.nil?
#     # validation errors prevented transaction from being created
#     p result.errors
#   else
#     puts "Transaction ID: #{result.transaction.id}"
#     # status will be processor_declined, gateway_rejected, or failed
#     puts "Transaction Status: #{result.transaction.status}"
#   end
# end


# create transaction and new user, save user to vault

result = Braintree:: Transaction.sale(
  :amount => "300",
  :credit_card => {
    :number => "378282246310005",
    :cvv => "1234",
    :expiration_date => "09/2015"
    },
  :customer => {
    :first_name => "Matthew",
    :last_name => "Mazza",

  }

  )






