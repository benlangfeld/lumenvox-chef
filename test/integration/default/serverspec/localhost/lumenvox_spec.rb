require 'spec_helper'

describe 'Lumenvox' do
  describe service('lvttsd') do
    it { should be_running }
  end

  describe service('lvsred') do
    it { should be_running }
  end

  describe service('lvmediaserverd') do
    it { should be_running }
  end

  describe service('lvlicensed') do
    it { should be_running }
  end
end
