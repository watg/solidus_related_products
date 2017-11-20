module Spree
  module Admin
    module AddRelatedAction
      def related
        load_resource
        @relation_types = Spree::Product.relation_types
      end

      Spree::Admin::ProductsController.prepend self
    end
  end
end
