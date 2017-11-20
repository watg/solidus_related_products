Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_sub_menu',
  name: 'add_product_relation_admin_sub_menu_tab',
  insert_bottom: '[data-hook="admin_product_sub_tabs"]',
  text: '<%= tab :relation_types %>',
  original: 'd1a70da8f31da0a082c6c5333d9837dcaca65c65'
)
