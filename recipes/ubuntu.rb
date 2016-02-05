# recipe to  = configure ubuntu with meteor
# for prime 8 consulting dev

prime_packages = [
 	'wget',
	'git',
	'vim',
	'tmux',
  'curl',
	'jq',
	'htop',
  'graphicsmagick'
]

package prime_packages do
  ignore_failure true
end

include_recipe 'meteor'


