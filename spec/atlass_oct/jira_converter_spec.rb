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

  describe '#convert_strong' do
    context 'when content has strong' do
      let!(:content) { '*strong*' }

      it { expect(described_class.convert_strong(content)).to eq('**strong**') }
    end

    context 'when content has strong with *' do
      context 'when content has strong with * of head' do
        let!(:content) { '**strong*' }

        it { expect(described_class.convert_strong(content)).to eq('***strong**') }
      end

      context 'when content has strong with * of end' do
        let!(:content) { '*strong**' }

        it { expect(described_class.convert_strong(content)).to eq('**strong***') }
      end

      context 'when content has strong with * of end' do
        let!(:content) { '***' }

        it { expect(described_class.convert_strong(content)).to eq('*****') }
      end
    end

    context 'when content has strongs' do
      let!(:content) { '*strong* *strong*' }

      it { expect(described_class.convert_strong(content)).to eq('**strong** **strong**') }
    end
  end

  describe '#convert_emphasis' do
    context 'when content has emphasis' do
      let!(:content) { '_emphasis_' }

      it { expect(described_class.convert_emphasis(content)).to eq('*emphasis*') }
    end

    context 'when content has emphasis with _' do
      context 'when content has emphasis with _ of head' do
        let!(:content) { '__emphasis_' }

        it { expect(described_class.convert_emphasis(content)).to eq('*_emphasis*') }
      end

      context 'when content has emphasis with _ of end' do
        let!(:content) { '_emphasis__' }

        it { expect(described_class.convert_emphasis(content)).to eq('*emphasis_*') }
      end

      context 'when content has emphasis with _' do
        let!(:content) { '___' }

        it { expect(described_class.convert_emphasis(content)).to eq('*_*') }
      end

      context 'when content __' do
        let!(:content) { '__' }

        it { expect(described_class.convert_emphasis(content)).to eq('__') }
      end
    end
  end
end
