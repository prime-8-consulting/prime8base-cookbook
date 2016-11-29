# Encoding: UTF-8
#
# Cookbook Name:: prime-8-base
# Recipe:: devbox
#
# Copyright 2016 prime 8 consulting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'sbp_packer'
include_recipe 'terraform'
include_recipe 'nodejs'
include_recipe 'ruby_build'
include_recipe 'ruby_rbenv::system'

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

user 'prime8' do
  manage_home true
  home '/home/prime8'
  shell '/bin/bash'
  password 'prime8'
end

# ruby dependencies
package ['libssl-dev', 'libreadline-dev', 'zlib1g-dev']

# setup a ruby environment identical to what's on buildserver
rbenv_ruby "2.3.1"
rbenv_global "2.3.1"

gems = [
  'bundler',
  'thor',
  'highline',
  'rainbow',
  'aws-sdk',
  'inifile',
  'chef-berks',
  'ruby-graphviz',
  'mongo'
]

gems.each do |g|
  rbenv_gem g
end

file '/home/prime8/.bashrc' do
  content "export PATH=/usr/local/rbenv/bin:/usr/local/rbenv/versions/2.3.1/bin:$PATH"
  owner 'prime8'
  group 'prime8'
  mode '755'
end

directory '/home/prime8/.ssh'
owner 'prime8'
group 'prime8'
mode '0600'
end

# chef recipe to build dev environment vm
# build out the filesystem for storing our own
# data on the buildserver. There's repermissioning after
# write on some of the dirs.
cloud8_dirs = [
  '/home/prime8/.cloud8',
  '/home/prime8/.cloud8/creds',
  '/home/prime8/.cloud8/backups',
  '/home/prime8/.cloud8/terraform-tmp'
]

cloud8_dirs.each do |d|
  directory d do
    owner 'prime8'
    group 'prime8'
    mode '0755'
  end
end

# this the filesystem where we do
# development. It's set up semantically
# in the pattern of the metarepository
cloud8_devdirs = [
  '/home/prime8/prime-8-dev',
  '/home/prime8/prime-8-dev/dev',
  '/home/prime8/prime-8-dev/ops'
]

cloud8_devdirs.each do |d|
  directory d do
    owner 'prime8'
    group 'prime8'
    mode '0755'
  end
end
