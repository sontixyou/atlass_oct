# frozen_string_literal: true

require 'atlass_oct/jira_converter'

RSpec.describe AtlassOct::JiraConverter do
  describe '#convert_headings' do
    context 'when content has h1 headings' do
      let!(:content) { 'h1. Heading 1' }

      # binding.break
      it { expect(described_class.convert_headings(content)).to eq('# Heading 1') }
    end

    context 'when content has h2 headings' do
      let!(:content) { 'h2. Heading 2' }

      it { expect(described_class.convert_headings(content)).to eq('## Heading 2') }
    end

    context 'when content has h3 headings' do
      let!(:content) { 'h3. Heading 3' }

      it { expect(described_class.convert_headings(content)).to eq('### Heading 3') }
    end

    context 'when content has h4 headings' do
      let!(:content) { 'h4. Heading 4' }

      it { expect(described_class.convert_headings(content)).to eq('#### Heading 4') }
    end

    context 'when content has h5 headings' do
      let!(:content) { 'h5. Heading 5' }

      it { expect(described_class.convert_headings(content)).to eq('##### Heading 5') }
    end

    context 'when content has h6 headings' do
      let!(:content) { 'h6. Heading 6' }

      it { expect(described_class.convert_headings(content)).to eq('###### Heading 6') }
    end
  end
end
