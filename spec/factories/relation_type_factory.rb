FactoryBot.define do
  factory :product_relation_type, class: Spree::RelationType do
    name       { ('A'..'Z').to_a.sample(6).join }
    applies_to 'Spree::Product'
  end

  factory :variant_relation_type, class: Spree::RelationType do
    name       { ('A'..'Z').to_a.sample(6).join }
    applies_to 'Spree::Variant'
  end
end
