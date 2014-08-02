#
# Cookbook Name:: pgpool2
# Recipe:: configure
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
### This recipe generates the pgpool.conf configuration file.  The configuration settings are
### controlled by the attributes/configure.rb file.
###

template "#{node['pgpool2']['config_dir']}/pgpool.conf" do
  source "pgpool.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[pgpool2]", :delayed
end
