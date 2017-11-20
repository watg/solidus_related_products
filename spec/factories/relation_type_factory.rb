FactoryBot.define do
  factory :relation_type, class: Spree::RelationType do
    name       { ('A'..'Z').to_a.sample(6).join }
    applies_to 'Spree::Product'
  end
end
