# frozen_string_literal: true

require 'spec_helper'

describe LogFileParser do
  describe '#all_pages_list' do
    subject(:all_pages_list) { log_file_parser.all_pages_list }

    let(:log_file_parser) { described_class.new(file_name) }

    context 'for valid webserver' do
      let(:file_name) { 'spec/data/valid_webserver.log' }

      it 'returns all pages' do
        expect(all_pages_list.count).to eq 3
      end
    end

    context 'for invalid webserver' do
      let(:file_name) { 'spec/data/invalid_webserver.log' }

      it 'raises error' do
        expect { all_pages_list }.to raise_error(LogFileParser::FileSyntaxError)
      end
    end
  end
end
