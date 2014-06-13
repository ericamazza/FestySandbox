require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "92r8vz8rypsycws4"
Braintree::Configuration.public_key = "589h2784zqq4sfy2"
Braintree::Configuration.private_key = "b06d56f93845cf508ef0c8b9a8f15615"


result = Braintree::Subscription.update(
  "63yrm2",
  :discounts => {
    :add => [
      {
        :inherited_from_id => "k7yw",
        :amount => BigDecimal.new("10.00")
      }
    ]
}
)

if result.success?
  discounts_collection = result.subscription.discounts
  discounts_collection.each do |d|
  	puts d.current_billing_cycle
  end
else
  p result.errors
end