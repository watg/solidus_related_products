# frozen_string_literal: true

FactoryBot.define do
  factory :product_relation, class: Spree::Relation do
    association :relatable, factory: :product
    association :related_to, factory: :product
    relation_type { 'Spree::Product' }
  end

  factory :variant_relation, class: Spree::Relation do
    association :relatable, factory: :product
    association :related_to, factory: :variant
    relation_type { 'Spree::Variant' }
  end

  factory :product_relation_type, class: Spree::RelationType do
    name { ('A'..'Z').to_a.sample(6).join }
    applies_from { 'Spree::Product' }
    applies_to { 'Spree::Product' }
  end

  factory :variant_relation_type, class: Spree::RelationType do
    name       { ('A'..'Z').to_a.sample(6).join }
    applies_from { 'Spree::Product' }
    applies_to { 'Spree::Variant' }
  end
end
