# frozen_string_literal: true

class Spree::Relation < ApplicationRecord
  belongs_to :relation_type
  belongs_to :relatable, polymorphic: true, touch: true
  belongs_to :related_to, polymorphic: true

  validates :relation_type, :relatable, :related_to, presence: true

  after_create :create_inverse, unless: :has_inverse?, if: :bidirectional?

  delegate :bidirectional?, to: :relation_type, allow_nil: true

  def has_inverse?
    self.class.exists?(inverse_options)
  end

  def inverses
    self.class.where(inverse_options)
  end

  private

  def inverse_options
    { relation_type: relation_type, relatable: related_to, related_to: relatable }
  end

  def create_inverse
    self.class.create!(inverse_options.merge(description: description))
  end
end
