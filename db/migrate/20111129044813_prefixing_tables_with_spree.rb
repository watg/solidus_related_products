# frozen_string_literal: true

class PrefixingTablesWithSpree < SolidusSupport::Migration[4.2]
  def change
    rename_table :relation_types, :spree_relation_types
    rename_table :relations, :spree_relations
  end
end
