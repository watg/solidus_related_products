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
end
