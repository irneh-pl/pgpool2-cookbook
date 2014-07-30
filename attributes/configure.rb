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

# These attributes are used to generate a pgpool.conf by Chef.  See the pgpool-II documentation for
# details on configuration settings.
#
# NOTES:  If you're not going to enable a setting, set the attribute's value to nil.  This will be the same as
# commenting out the setting in the configuration file.  Values of on and off must be enclosed in quotes.

# Network settings
default['pgpool2']['conf']['listen_addresses'] = '*'
default['pgpool2']['conf']['port'] = 5432
default['pgpool2']['conf']['socket_dir'] = '/var/run/postgresql'
default['pgpool2']['conf']['pcp_port'] = 9898
default['pgpool2']['conf']['pcp_socket_dir'] = '/var/run/postgresql'

# Host configuration
# NOTE: If you want to add more hosts to your cluster, copy five attributes and change the integer
# at the end of each attribute name to a higher value.  For instance a three node cluster will
# start with 0 and end with 2.
default['pgpool2']['conf']['backend_hostname0'] = 'node0.tld'
default['pgpool2']['conf']['backend_port0'] = 5432
default['pgpool2']['conf']['backend_weight0'] = 0
default['pgpool2']['conf']['backend_data_directory0'] = '/var/lib/postgresql/9.2'
default['pgpool2']['conf']['flag0'] = 'ALLOW_TO_FAILOVER'

default['pgpool2']['conf']['backend_hostname1'] = 'node1.tld'
default['pgpool2']['conf']['backend_port1'] = 5432
default['pgpool2']['conf']['backend_weight1'] = 0
default['pgpool2']['conf']['backend_data_directory1'] = '/var/lib/postgresql/9.2'
default['pgpool2']['conf']['flag1'] = 'ALLOW_TO_FAILOVER'

# Authentication settings
default['pgpool2']['conf']['enable_pool_hba'] = 'on'
default['pgpool2']['conf']['pool_passwd'] = ''
default['pgpool2']['conf']['authentication_timeout'] = 60

# SSL connection settings
default['pgpool2']['conf']['ssl'] = 'off'
default['pgpool2']['conf']['ssl_key'] = nil
default['pgpool2']['conf']['ssl_cert'] = nil
default['pgpool2']['conf']['ssl_ca_cert'] = nil
default['pgpool2']['conf']['ssl_ca_cert_dir'] = nil

# Pool parameters
default['pgpool2']['conf']['num_init_children'] = 30
default['pgpool2']['conf']['max_pool'] = 100
default['pgpool2']['conf']['child_life_time'] = 1800
default['pgpool2']['conf']['child_max_connections'] = 0
default['pgpool2']['conf']['connection_life_time'] = 3600
default['pgpool2']['conf']['client_idle_limit'] = 30

# Log settings
default['pgpool2']['conf']['log_destination'] = 'stderr'
default['pgpool2']['conf']['print_timestamp'] = 'on'
default['pgpool2']['conf']['log_connections'] = 'on'
default['pgpool2']['conf']['log_hostname'] = 'off'
default['pgpool2']['conf']['log_statement'] = 'off'
default['pgpool2']['conf']['log_per_node_statement'] = 'off'
default['pgpool2']['conf']['log_standby_delay'] = 'none'
default['pgpool2']['conf']['syslog_facility'] = 'LOCAL0'
default['pgpool2']['conf']['syslog_ident'] = 'pgpool'
default['pgpool2']['conf']['debug_level'] = 0

# File locations
default['pgpool2']['conf']['pid_file_name'] = '/var/run/postgresql/pgpool.pid'
default['pgpool2']['conf']['logdir'] = '/var/log/postgresql'

# Connection caching
default['pgpool2']['conf']['connection_cache'] = 'on'
default['pgpool2']['conf']['reset_query_list'] = 'ABORT; DISCARD ALL'

# Replication mode settings
default['pgpool2']['conf']['replication_mode'] = 'off'
default['pgpool2']['conf']['replicate_select'] = 'off'
default['pgpool2']['conf']['insert_lock'] = 'on'
default['pgpool2']['conf']['lobj_lock_table'] = ''
default['pgpool2']['conf']['replication_stop_on_mismatch'] = 'off'
default['pgpool2']['conf']['failover_if_affected_tuples_mismatch'] = 'off'

# Load balancing mode settings
default['pgpool2']['conf']['load_balance_mode'] = 'off'
default['pgpool2']['conf']['ignore_leading_white_space'] = 'on'
default['pgpool2']['conf']['white_function_list'] = ''
default['pgpool2']['conf']['black_function_list'] = 'nextval,setval'

# Master/slave mode settings
default['pgpool2']['conf']['master_slave_mode'] = 'off'
default['pgpool2']['conf']['master_slave_sub_mode'] = 'stream'
default['pgpool2']['conf']['sr_check_period'] = 10
default['pgpool2']['conf']['sr_check_user'] = 'postgres'
default['pgpool2']['conf']['sr_check_password'] = ''
default['pgpool2']['conf']['delay_threshold'] = 0
default['pgpool2']['conf']['follow_master_command'] = ''

# Parallel mode settings
default['pgpool2']['conf']['parallel_mode'] = 'off'
default['pgpool2']['conf']['pgpool2_hostname'] = ''
default['pgpool2']['conf']['system_db_hostname'] = 'localhost'
default['pgpool2']['conf']['system_db_port'] = 5432
default['pgpool2']['conf']['system_db_name'] = 'pgpool'
default['pgpool2']['conf']['system_db_schema'] = 'pgpool_catalog'
default['pgpool2']['conf']['system_db_user'] = 'pgpool'
default['pgpool2']['conf']['system_db_password'] = ''

# Health check settings
default['pgpool2']['conf']['health_check_period'] = 10
default['pgpool2']['conf']['health_check_timeout'] = 20
default['pgpool2']['conf']['health_check_user'] = 'postgres'
default['pgpool2']['conf']['health_check_password'] = ''
default['pgpool2']['conf']['health_check_max_retries'] = 10
default['pgpool2']['conf']['health_check_retry_delay'] = 3

# Failover and Failback settings
default['pgpool2']['conf']['failover_command'] = ''
default['pgpool2']['conf']['failback_command'] = ''
default['pgpool2']['conf']['fail_over_on_backend_error'] = 'on'
default['pgpool2']['conf']['search_primary_node_timeout'] = 10

# Online recovery settings
default['pgpool2']['conf']['recovery_user'] = 'nobody'
default['pgpool2']['conf']['recovery_password'] = ''
default['pgpool2']['conf']['recovery_1st_stage_command'] = ''
default['pgpool2']['conf']['recovery_2nd_stage_command'] = ''
default['pgpool2']['conf']['recovery_timeout'] = 90
default['pgpool2']['conf']['client_idle_limit_in_recovery'] = 0

# Watchdog settings
default['pgpool2']['conf']['use_watchdog'] = 'off'
default['pgpool2']['conf']['trusted_servers'] = ''
default['pgpool2']['conf']['ping_path'] = '/bin'
default['pgpool2']['conf']['wd_hostname'] = ''
default['pgpool2']['conf']['wd_port'] = 9000
default['pgpool2']['conf']['wd_authkey'] = ''
default['pgpool2']['conf']['delegate_IP'] = ''
default['pgpool2']['conf']['ifconfig_path'] = '/sbin'
default['pgpool2']['conf']['if_up_cmd'] = 'ifconfig eth0:0 indet $_IP_$ netmask 255.255.255.0'
default['pgpool2']['conf']['if_down_cmd'] = 'ifconfig eth0:0 down'
default['pgpool2']['conf']['arping_path'] = '/usr/sbin'
default['pgpool2']['conf']['arping_cmd'] = 'arping -U $_IP_$ -w 1'
default['pgpool2']['conf']['clear_memqcache_on_escalation'] = 'on'
default['pgpool2']['conf']['wd_escalation_command'] = ''
default['pgpool2']['conf']['wd_lifecheck_method'] = 'heartbeat'
default['pgpool2']['conf']['wd_interval'] = 10
default['pgpool2']['conf']['wd_heartbeat_port'] = 9694
default['pgpool2']['conf']['wd_heartbeat_keepalive'] = 2
default['pgpool2']['conf']['wd_heartbeat_deadtime'] = 30
default['pgpool2']['conf']['heartbeat_destination_port0'] = 9694
default['pgpool2']['conf']['heartbeat_device0'] = ''

# Other settings
default['pgpool2']['conf']['relcache_expire'] = 0
default['pgpool2']['conf']['relcache_size'] = 256
default['pgpool2']['conf']['check_temp_table'] = 'on'

# Memory Cache settings
default['pgpool2']['conf']['memory_cache_enabled'] = 'off'
default['pgpool2']['conf']['memqcache_method'] = 'shmem'
default['pgpool2']['conf']['memqcache_memcached_host'] = 'localhost'
default['pgpool2']['conf']['memqcache_memcached_port'] = 12111
default['pgpool2']['conf']['memqcache_total_size'] = 67108864
default['pgpool2']['conf']['memqcache_max_num_cache'] = 1000000
default['pgpool2']['conf']['memqcache_expire'] = 0
default['pgpool2']['conf']['memqcache_auto_cache_invalidation'] = 'on'
default['pgpool2']['conf']['memqcache_maxcache'] = 409600
default['pgpool2']['conf']['memqcache_cache_block_size'] = 1048576
default['pgpool2']['conf']['memqcache_oiddir'] = '/var/log/pgpool/oiddir'
default['pgpool2']['conf']['white_memqcache_table_list'] = ''
default['pgpool2']['conf']['black_memqcache_table_list'] = ''
