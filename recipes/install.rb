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

remote_file = "http://www.pgpool.net/download.php?f=pgpool-II-#{node['pgpool2']['version']}.tar.gz"
source_file = "pgpool-II-#{node['pgpool2']['version']}.tar.gz"

# Compile and install pgpool application
bash "build_and_install_pgpool2" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    cd #{Chef::Config[:file_cache_path]}
    wget -O #{source_file} #{remote_file}
    tar -zxvf #{source_file}
    cd pgpool-II-#{node['pgpool2']['version']}
    ./configure #{configuration}
    make && make install
  EOF
end

# Set up the upstart service
template "/etc/init/pgpool2.conf" do
  source "pgpool2-upstart.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
service "pgpool2" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true
  action :enable
end
