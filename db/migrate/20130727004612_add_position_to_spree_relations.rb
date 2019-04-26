# frozen_string_literal: true

class AddPositionToSpreeRelations < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_relations, :position, :integer
  end
end
