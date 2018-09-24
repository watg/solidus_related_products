module SolidusRelatedProducts
  module Product
    RSpec.describe AddRelationMethods do
      describe '#destroy_product_relations' do
        let(:klass) { Class.new(ActiveRecord::Base) }

        it 'adds relation removal hook with after_destroy' do
          expect(klass).to receive(:after_destroy).with(:destroy_product_relations)
          klass.prepend(AddRelationMethods)
        end

        context 'when after_discard is available' do
          let(:klass) do
            Class.new(ActiveRecord::Base) do
              def self.after_discard(*args); end
            end
          end

          it 'adds relation removal hook with after_discard' do
            expect(klass).to receive(:after_discard).with(:destroy_product_relations)
            klass.prepend(AddRelationMethods)
          end
        end
      end
    end
  end
end
