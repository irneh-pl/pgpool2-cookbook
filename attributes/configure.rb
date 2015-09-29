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
default['pgpool2']['config']['listen_addresses'] = '*'
default['pgpool2']['config']['port'] = 5432
default['pgpool2']['config']['socket_dir'] = '/var/run/postgresql'
default['pgpool2']['config']['pcp_port'] = 9898
default['pgpool2']['config']['pcp_socket_dir'] = '/var/run/postgresql'

# Host configuration
# NOTE: If you want to add more hosts to your cluster, copy five attributes and change the integer
# at the end of each attribute name to a higher value.  For instance a three node cluster will
# start with 0 and end with 2.
default['pgpool2']['config']['backend_hostname0'] = 'localhost'
default['pgpool2']['config']['backend_port0'] = 5432
default['pgpool2']['config']['backend_weight0'] = 0
default['pgpool2']['config']['backend_data_directory0'] = '/var/lib/postgresql/9.3'
default['pgpool2']['config']['flag0'] = 'DISALLOW_TO_FAILOVER'

default['pgpool2']['config']['backend_hostname1'] = nil
default['pgpool2']['config']['backend_port1'] = nil
default['pgpool2']['config']['backend_weight1'] = nil
default['pgpool2']['config']['backend_data_directory1'] = nil
default['pgpool2']['config']['flag1'] = nil

# Authentication settings
default['pgpool2']['config']['enable_pool_hba'] = true
default['pgpool2']['config']['pool_passwd'] = ''
default['pgpool2']['config']['authentication_timeout'] = 60

# SSL connection settings
default['pgpool2']['config']['ssl'] = false
default['pgpool2']['config']['ssl_key'] = nil
default['pgpool2']['config']['ssl_cert'] = nil
default['pgpool2']['config']['ssl_ca_cert'] = nil
default['pgpool2']['config']['ssl_ca_cert_dir'] = nil

# Pool parameters
default['pgpool2']['config']['num_init_children'] = 5
default['pgpool2']['config']['max_pool'] = 50
default['pgpool2']['config']['child_life_time'] = 1800
default['pgpool2']['config']['child_max_connections'] = 0
default['pgpool2']['config']['connection_life_time'] = 3600
default['pgpool2']['config']['client_idle_limit'] = 30

# Log settings
default['pgpool2']['config']['log_destination'] = 'stderr'
default['pgpool2']['config']['print_timestamp'] = true
default['pgpool2']['config']['log_connections'] = true
default['pgpool2']['config']['log_hostname'] = false
default['pgpool2']['config']['log_statement'] = false
default['pgpool2']['config']['log_per_node_statement'] = false
default['pgpool2']['config']['log_standby_delay'] = 'none'
default['pgpool2']['config']['syslog_facility'] = 'LOCAL0'
default['pgpool2']['config']['syslog_ident'] = 'pgpool'
default['pgpool2']['config']['debug_level'] = 0

# File locations
default['pgpool2']['config']['pid_file_name'] = '/var/run/postgresql/pgpool.pid'
default['pgpool2']['config']['logdir'] = '/var/log/postgresql'

# Connection caching
default['pgpool2']['config']['connection_cache'] = true
default['pgpool2']['config']['reset_query_list'] = 'ABORT; DISCARD ALL'

# Replication mode settings
default['pgpool2']['config']['replication_mode'] = false
default['pgpool2']['config']['replicate_select'] = false
default['pgpool2']['config']['insert_lock'] = true
default['pgpool2']['config']['lobj_lock_table'] = ''
default['pgpool2']['config']['replication_stop_on_mismatch'] = false
default['pgpool2']['config']['failover_if_affected_tuples_mismatch'] = false

# Load balancing mode settings
default['pgpool2']['config']['load_balance_mode'] = false
default['pgpool2']['config']['ignore_leading_white_space'] = true
default['pgpool2']['config']['white_function_list'] = ''
default['pgpool2']['config']['black_function_list'] = 'nextval,setval'

# Master/slave mode settings
default['pgpool2']['config']['master_slave_mode'] = false
default['pgpool2']['config']['master_slave_sub_mode'] = 'stream'
default['pgpool2']['config']['sr_check_period'] = 10
default['pgpool2']['config']['sr_check_user'] = 'postgres'
default['pgpool2']['config']['sr_check_password'] = ''
default['pgpool2']['config']['delay_threshold'] = 0
default['pgpool2']['config']['follow_master_command'] = ''

# Parallel mode settings
default['pgpool2']['config']['parallel_mode'] = false
default['pgpool2']['config']['pgpool2_hostname'] = ''
default['pgpool2']['config']['system_db_hostname'] = 'localhost'
default['pgpool2']['config']['system_db_port'] = 5432
default['pgpool2']['config']['system_db_name'] = 'pgpool'
default['pgpool2']['config']['system_db_schema'] = 'pgpool_catalog'
default['pgpool2']['config']['system_db_user'] = 'pgpool'
default['pgpool2']['config']['system_db_password'] = ''

# Health check settings
default['pgpool2']['config']['health_check_period'] = 10
default['pgpool2']['config']['health_check_timeout'] = 20
default['pgpool2']['config']['health_check_user'] = 'postgres'
default['pgpool2']['config']['health_check_password'] = ''
default['pgpool2']['config']['health_check_max_retries'] = 10
default['pgpool2']['config']['health_check_retry_delay'] = 3

# Failover and Failback settings
default['pgpool2']['config']['failover_command'] = ''
default['pgpool2']['config']['failback_command'] = ''
default['pgpool2']['config']['fail_over_on_backend_error'] = true
default['pgpool2']['config']['search_primary_node_timeout'] = 10

# Online recovery settings
default['pgpool2']['config']['recovery_user'] = 'nobody'
default['pgpool2']['config']['recovery_password'] = ''
default['pgpool2']['config']['recovery_1st_stage_command'] = ''
default['pgpool2']['config']['recovery_2nd_stage_command'] = ''
default['pgpool2']['config']['recovery_timeout'] = 90
default['pgpool2']['config']['client_idle_limit_in_recovery'] = 0

# Watchdog settings
default['pgpool2']['config']['use_watchdog'] = false
default['pgpool2']['config']['trusted_servers'] = ''
default['pgpool2']['config']['ping_path'] = '/bin'
default['pgpool2']['config']['wd_hostname'] = ''
default['pgpool2']['config']['wd_port'] = 9000
default['pgpool2']['config']['wd_authkey'] = ''
default['pgpool2']['config']['delegate_IP'] = ''
default['pgpool2']['config']['ifconfig_path'] = '/sbin'
default['pgpool2']['config']['if_up_cmd'] = 'ifconfig eth0:0 inet $_IP_$ netmask 255.255.255.0'
default['pgpool2']['config']['if_down_cmd'] = 'ifconfig eth0:0 down'
default['pgpool2']['config']['arping_path'] = '/usr/sbin'
default['pgpool2']['config']['arping_cmd'] = 'arping -U $_IP_$ -w 1'
default['pgpool2']['config']['clear_memqcache_on_escalation'] = true
default['pgpool2']['config']['wd_escalation_command'] = ''
default['pgpool2']['config']['wd_lifecheck_method'] = 'heartbeat'
default['pgpool2']['config']['wd_interval'] = 10
default['pgpool2']['config']['wd_heartbeat_port'] = 9694
default['pgpool2']['config']['wd_heartbeat_keepalive'] = 2
default['pgpool2']['config']['wd_heartbeat_deadtime'] = 30
default['pgpool2']['config']['heartbeat_destination_port0'] = 9694
default['pgpool2']['config']['heartbeat_device0'] = ''

# Other settings
default['pgpool2']['config']['relcache_expire'] = 0
default['pgpool2']['config']['relcache_size'] = 256
default['pgpool2']['config']['check_temp_table'] = true

# Memory Cache settings
default['pgpool2']['config']['memory_cache_enabled'] = false
default['pgpool2']['config']['memqcache_method'] = 'shmem'
default['pgpool2']['config']['memqcache_memcached_host'] = 'localhost'
default['pgpool2']['config']['memqcache_memcached_port'] = 12111
default['pgpool2']['config']['memqcache_total_size'] = 67108864
default['pgpool2']['config']['memqcache_max_num_cache'] = 1000000
default['pgpool2']['config']['memqcache_expire'] = 0
default['pgpool2']['config']['memqcache_auto_cache_invalidation'] = true
default['pgpool2']['config']['memqcache_maxcache'] = 409600
default['pgpool2']['config']['memqcache_cache_block_size'] = 1048576
default['pgpool2']['config']['memqcache_oiddir'] = '/var/log/pgpool/oiddir'
default['pgpool2']['config']['white_memqcache_table_list'] = ''
default['pgpool2']['config']['black_memqcache_table_list'] = ''
