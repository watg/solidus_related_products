# frozen_string_literal: true

module SolidusRelatedProducts
  module Variant
    module AddRelationInterfaceMethods
      def name_for_relation
        descriptive_name
      end

      def related_cache_key
        product.updated_at
      end

      def variant
        self
      end

      delegate :available?, to: :product

      Spree::Variant.prepend self
    end
  end
end
