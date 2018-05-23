module SolidusRelatedProducts
  module Variant
    module AddRelationInterfaceMethods
      def name_for_relation
        descriptive_name
      end

      def cache_key
        product.updated_at
      end

      def available?
        product.available?
      end

      Spree::Variant.prepend self
    end
  end
end
