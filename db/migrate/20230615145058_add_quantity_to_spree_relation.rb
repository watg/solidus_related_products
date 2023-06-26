class AddQuantityToSpreeRelation < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_relations, :quantity, :integer
    add_index :spree_relations, :quantity
  end
end
