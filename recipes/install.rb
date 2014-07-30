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

include_recipe 'build-essential'
include_recipe 'postgresql::client'

# Define the make configuration options
configuration = "--prefix=#{node['pgpool2']['prefix_dir']}"
if node['pgpool2']['use_ssl']
  configuration = configuration + " --with-openssl"
end
if node['pgpool2']['memcached_dir']
  configuration = configuration + " --with-memcached=#{node['pgpool2']['memcached_dir']}"
end

# Download the source from project site
remote_file "#{Chef::Config[:file_cache_path]}/pgpool-II-#{node['pgpool2']['version']}.tar.gz" do
  source "http://www.pgpool.net/download.php?f=pgpool-II-#{node['pgpool2']['version']}.tar.gz"
  action :create
end

bash "build-and-install-pgpool" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar -zxvf pgpool-II-#{node['pgpool2']['version']}.tar.gz
    (cd pgpool-II-#{node['pgpool2']['version']} && ./configure #{configuration})
    (cd pgpool-II-#{node['pgpool2']['version']} && make && make install)
  EOF
end

# apt_package "libpgpool0" do
#   action :install
# end
#
# apt_package "pgpool2" do
#   action :install
# end

