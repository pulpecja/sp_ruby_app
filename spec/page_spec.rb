# frozen_string_literal: true

require 'spec_helper'

describe Page do
  let(:page) { described_class.new(url) }
  let(:url) { 'www.hello.pl' }

  shared_examples 'when page has no visits it returns 0' do
    context 'when page has no visits' do
      it 'returns 0' do
        expect(subject).to eq 0
      end
    end
  end

  describe '#add_visit' do
    let(:ip) { '111.111.111.111' }

    it 'adds successfully new visit' do
      page.add_visit(ip)
      expect(page.visits).to include ip
    end
  end

  describe '#visits_count' do
    subject(:visits_count) { page.visits_count }

    include_examples 'when page has no visits it returns 0'

    context 'when page has 2 visits' do
      before do
        page.add_visit('111.111.111.111')
        page.add_visit('222.222.222.222')
      end

      it 'returns 2' do
        expect(visits_count).to eq 2
      end
    end
  end

  describe '#uniq_visits_count' do
    subject(:uniq_visits_count) { page.uniq_visits_count }

    include_examples 'when page has no visits it returns 0'

    context 'when page has 2 visits' do
      context 'and they are different' do
        before do
          page.add_visit('111.111.111.111')
          page.add_visit('222.222.222.222')
        end

        it 'returns 2' do
          expect(uniq_visits_count).to eq 2
        end
      end

      context 'and they are the same' do
        before do
          page.add_visit('111.111.111.111')
          page.add_visit('111.111.111.111')
        end

        it 'returns 1' do
          expect(uniq_visits_count).to eq 1
        end
      end
    end
  end
end
