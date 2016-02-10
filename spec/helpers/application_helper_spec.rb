require 'rails_helper'
require 'pp'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#nav_entry' do
    before :each do
      @item = helper.nav_entry('test', 'http://google.com')
    end

    it 'should return a content tag' do
      expect(@item).to include('<li')
      expect(@item).to include('http://google.com')
      expect(@item).to include('test')
    end
  end

  describe '#list_group_item' do
    before :each do
      @item = helper.nav_entry('test', 'http://google.com')
    end

    it 'should return a content tag' do
      expect(@item).to include('<li')
      expect(@item).to include('http://google.com')
      expect(@item).to include('test')
    end
  end

  describe '#bootstrap_color' do
    it 'should respond with danger on error' do
      expect(helper.bootstrap_color('error')).to match('danger')
    end

    it 'should respond with danger on alert' do
      expect(helper.bootstrap_color('alert')).to match('danger')
    end

    it 'should respond with info on notice' do
      expect(helper.bootstrap_color('notice')).to match('info')
    end

    it 'should respond with itself for anything else' do
      expect(helper.bootstrap_color('memes')).to match('memes')
      expect(helper.bootstrap_color('bootstrap')).to match('bootstrap')
    end
  end
end
