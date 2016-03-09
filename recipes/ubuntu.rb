# recipe to  = configure ubuntu
# for prime 8 consulting dev

prime_packages = [
 	'wget',
	'git',
	'vim',
	'tmux',
	'htop',
  'graphicsmagick',
	'jq'
]

package prime_packages do
  retries 3
  retry_delay 10
  ignore_failure true
end



