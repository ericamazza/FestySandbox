require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "92r8vz8rypsycws4"
Braintree::Configuration.public_key = "589h2784zqq4sfy2"
Braintree::Configuration.private_key = "b06d56f93845cf508ef0c8b9a8f15615"

customer = Braintree::Customer.find("54914673")
customer.credit_cards.size
#=> 1
result = Braintree::Customer.update(
  customer.id,
  :credit_card => {
    :number => "4111111111111111",
    :expiration_date => "09/2015",
    :cvv => "123"
  }
)
if result.success?
  result.customer.credit_cards.size
  #=> 2
else
  p result.errorseach do |error|
	puts error.code
	puts error.message
end
end

