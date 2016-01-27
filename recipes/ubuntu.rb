# recipe to  = configure ubuntu with meteor
# for prime 8 consulting dev

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

package prime_packages 

include_recipe 'meteor'
