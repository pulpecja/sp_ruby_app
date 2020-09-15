# frozen_string_literal: true

require 'spec_helper'

describe PagesService do
  let(:page_service) { described_class.new('file_name') }
  let(:log_file_response) { [page, page_2, page_3] }
  let(:page) { Page.new('www.hello.pl') }
  let(:page_2) { Page.new('www.hi.pl') }
  let(:page_3) { Page.new('www.czesc.pl') }

  before do
    page_2.add_visit('111.111.111.111')
    page_3.add_visit('222.222.222.222')
    page_3.add_visit('222.222.222.222')
    allow(LogFileParser).to receive_message_chain(:new, :all_pages_list).and_return(log_file_response)
  end

  describe '#show_pages_with_all_visits' do
    subject(:show_pages_with_all_visits) { page_service.show_pages_with_all_visits }

    let(:expected_response) do
      ['Page www.czesc.pl had 2 visits.',
       'Page www.hi.pl had 1 visits.',
       'Page www.hello.pl had 0 visits.']
    end

    it 'returns expected response' do
      expect(show_pages_with_all_visits).to eq expected_response
    end
  end

  describe '#show_pages_with_unique_visits' do
    subject(:show_pages_with_unique_visits) { page_service.show_pages_with_unique_visits }

    let(:expected_response) do
      ['Page www.czesc.pl had 1 unique visits.',
       'Page www.hi.pl had 1 unique visits.',
       'Page www.hello.pl had 0 unique visits.']
    end

    it 'returns expected response' do
      expect(show_pages_with_unique_visits).to eq expected_response
    end
  end
end
