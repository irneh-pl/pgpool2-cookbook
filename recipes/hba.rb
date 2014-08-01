#
# Cookbook Name:: pgpool2
# Recipe:: hba
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
### This recipe installs the pg_hba and pool_hba configuration files.  The settings are
### controlled by the attributes in attributes/hba.rb.
###

records = node['pgpool2']['hba']['record'].map do | ip_address |
  "#{ip_address['type']}    #{ip_address['database']}    #{ip_address['user']}    #{ip_address['address']}    #{ip_address['access_method']}"
end

template "#{node['pgpool2']['config_dir']}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
      :ip_addresses => records
  )
end

template "#{node['pgpool2']['config_dir']}/pool_hba.conf" do
  source "pool_hba.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
      :ip_addresses => records
  )
end

service "pgpool2" do
  action :restart
end
