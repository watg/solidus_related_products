# frozen_string_literal: true

class Spree::Relation < ApplicationRecord
  belongs_to :relation_type
  belongs_to :relatable, polymorphic: true, touch: true
  belongs_to :related_to, polymorphic: true

  validates :relation_type, :relatable, :related_to, presence: true
end
