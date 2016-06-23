# recipe to  = configure ubuntu
# for prime 8 consulting dev

prime_packages = [
  'vim',
  'tmux',
  'wget',
  'curl',
	'git',
	'htop'
]

package prime_packages


package 'graphicsmagick' do
  options '--no-install-recommends'
  ignore_failure true
end

package 'ghostscript' do
  options '--no-install-recommends'
  ignore_failure true
end