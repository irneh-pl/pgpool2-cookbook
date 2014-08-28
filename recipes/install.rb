#
# Cookbook Name:: pgpool2
# Recipe:: install
#
# Copyright 2014, Pulselocker, Inc.
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

###
### This recipe downloads the pgpool2 source, compiles, and installs the application.
###
if node['platform_family'] == 'debian'
  include_recipe "apt::default"
end
include_recipe 'build-essential'
include_recipe 'postgresql::client'

# Create runtime user account
user node['pgpool2']['user'] do
  comment 'Postgres Runtime User'
  shell '/bin/false'
  system true
  action :create
end

# Define the make configuration options
configuration = "--prefix=#{node['pgpool2']['prefix_dir']}"
if node['pgpool2']['use_ssl']
  configuration = configuration + ' --with-openssl'
end
if node['pgpool2']['memcached_dir']
  configuration = configuration + " --with-memcached=#{node['pgpool2']['memcached_dir']}"
end

remote_file = "http://www.pgpool.net/download.php?f=pgpool-II-#{node['pgpool2']['version']}.tar.gz"
source_file = "pgpool-II-#{node['pgpool2']['version']}.tar.gz"

# Compile and install pgpool application
bash 'build_and_install_pgpool2' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    cd #{Chef::Config[:file_cache_path]}
    wget -O #{source_file} #{remote_file}
    tar -zxvf #{source_file}
    cd pgpool-II-#{node['pgpool2']['version']}
    echo "...configuration options: #{configuration}"
    ./configure #{configuration}
    make && make install
  EOF
end

directory node['pgpool2']['log_dir'] do
  owner 'root'
  group node['pgpool2']['user']
  mode 0770
  action :create
end

directory '/var/run/postgresql' do
  owner 'root'
  group node['pgpool2']['user']
  mode 0770
  action :create
end

# If master-slave mode enabled, install recovery scripts
if node['pgpool2']['config']['master_slave_mode']
  include_recipe 'pgpool2::_failover'
end

# Set up the upstart service
template '/etc/init/pgpool2.conf' do
  source 'pgpool2-upstart.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
end
service 'pgpool2' do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true
  action :enable
end

