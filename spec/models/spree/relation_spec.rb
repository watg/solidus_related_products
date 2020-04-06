# frozen_string_literal: true

RSpec.describe Spree::Relation, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:relation_type) }
    it { is_expected.to belong_to(:relatable) }
    it { is_expected.to belong_to(:related_to) }
    it { is_expected.to delegate_method(:bidirectional?).to(:relation_type).allow_nil }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:relation_type) }
    it { is_expected.to validate_presence_of(:relatable) }
    it { is_expected.to validate_presence_of(:related_to) }
  end

  context 'callbacks' do
    describe 'after create' do
      let(:inverse_relation) {
        described_class.find_by(
          relation_type: subject.relation_type,
          relatable: subject.related_to,
          related_to: subject.relatable,
          description: subject.description
        )
      }

      context 'when relation type is not bi-directional' do
        it 'does not add an inverse relation' do
          expect { create(:product_relation) }.to change { Spree::Relation.count }.from(0).to(1)

          expect(inverse_relation).to_not be_present
        end
      end

      context 'when relation type is bi-directional' do
        subject { create(:product_relation, :bidirectional, description: 'Lorem Ipsum') }

        it 'adds an inverse relation' do
          expect { subject }.to change { Spree::Relation.count }.from(0).to(2)

          expect(inverse_relation).to be_present
        end
      end
    end
  end
end
