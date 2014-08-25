#
# Cookbook Name:: pgpool2
# Recipe:: _failover
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
# Internal recipe to configure auto-failover in master-slave mode configurations
###
template "/usr/local/share/pgpool-II/failover.sh}" do
  source "failover.sh.erb"
  owner node['pgpool2']['user']
  group node['pgpool2']['user']
  mode 0750
end
template "/usr/local/share/pgpool-II/recovery.sh" do
  source "recovery.sh.erb"
  owner node['pgpool2']['user']
  group node['pgpool2']['user']
  mode 0750
end
template "/usr/local/share/pgpool-II/remote_start.sh" do
  source "remote_start.sh.erb"
  owner node['pgpool2']['user']
  group node['pgpool2']['user']
  mode 0750
end