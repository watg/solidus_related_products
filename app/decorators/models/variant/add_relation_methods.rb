module SolidusRelatedProducts
  module Variant
    module AddRelationMethods
      def name_for_relation
        descriptive_name
      end

      def available?
        product.available?
      end

      Spree::Variant.prepend self
    end
  end
end
