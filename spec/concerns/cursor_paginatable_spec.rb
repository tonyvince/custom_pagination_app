# spec/concerns/cursor_paginatable_spec.rb

require 'rails_helper'

RSpec.describe CursorPaginatable do
  let(:dummy_class) { Class.new { extend CursorPaginatable } }
  let(:relation) { double('ActiveRecord::Relation') }

  describe '#paginate_with_cursor' do
    context 'when there are more records' do
      let(:first_record) { double('Record', id: 1) }
      let(:second_record) { double('Record', id: 2) }
      let(:third_record) { double('Record', id: 3) }

      before do
        allow(relation).to receive(:where).and_return([second_record, third_record])
        allow(relation).to receive(:order).and_return(relation)
        allow(relation).to receive(:limit).and_return([first_record, second_record, third_record])
      end

      it 'returns metadata and relation without last record' do
        metadata, result = dummy_class.paginate_with_cursor(relation, items: 2, after: nil, by: :id)

        expect(metadata.items).to eq(2)
        expect(metadata.position).to eq(nil)
        expect(metadata.next_cursor).to eq(3)
        expect(metadata.has_more?).to eq(true)
        expect(result).to eq([first_record, second_record])
      end
    end

    context 'when there are no more records' do
      let(:first_record) { double('Record', id: 1) }
      let(:second_record) { double('Record', id: 2) }

      before do
        allow(relation).to receive(:where).and_return([second_record])
        allow(relation).to receive(:order).and_return(relation)
        allow(relation).to receive(:limit).and_return([first_record, second_record])
      end

      it 'returns metadata and relation as is' do
        metadata, result = dummy_class.paginate_with_cursor(relation, items: 2, after: nil, by: :id)

        expect(metadata.items).to eq(2)
        expect(metadata.position).to eq(nil)
        expect(metadata.next_cursor).to eq(nil)
        expect(metadata.has_more?).to eq(false)
        expect(result).to eq([first_record, second_record])
      end
    end
  end
end
