require 'rails_helper'

RSpec.describe MarkdownHelper, type: :helper do
  describe '#raw_markdown_from_file' do
    before :each do
      @html = helper.raw_markdown_from_file('docs/en/terms.md')
    end

    it 'should return rendered markdown from a file' do
      expect(@html).to include('Terms of Service')
    end
  end
end
