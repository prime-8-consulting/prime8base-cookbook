# recipe to configure ubuntu
# for prime 8 consulting dev

include_recipe 'apt::cacher-client'

prime_packages = [
  'vim',
  'tmux',
  'wget',
  'curl',
	'git',
	'htop',
  'build-essential',
  'zsh'
]

package prime_packages

package 'graphicsmagick' do
  options '--no-install-recommends'
  ignore_failure true
end
