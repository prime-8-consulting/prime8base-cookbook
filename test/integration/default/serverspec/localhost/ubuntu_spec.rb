# Encoding: UTF-8

require_relative '../spec_helper.rb'

describe 'prime8base::ubuntu' do
  
	prime_packages = [
		'wget',
		'git',
		'vim',
		'tmux',
		'jq',
		'htop',
		'curl',
		'graphicsmagick'
	]

  prime_packages.each do |p|
    describe package(p) do
      it 'is installed' do 
        expect(subject).to be_installed
      end 
    end
  end

  describe user('meteor') do
    it { should exist }
  end

  describe command('sudo -u meteor whoami') do
    its(:stdout) { should match /meteor/ }
  end
 
end
