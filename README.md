pgpool2 Cookbook
================
This cookbook installs and configures pgpool-II, a connection management application for PostgreSQL.

Requirements
------------
The cookbook currently only supports Ubuntu OS.  Tested on Ubuntu 12.04 and 14.04.

#### packages
- `build-essential` - Tools required for building software.
- `postgresql` - Client drivers for PostgreSQL.

Attributes
----------

#### pgpool2::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pgpool2']['version']</tt></td>
    <td>String</td>
    <td>Version number to download and install.</td>
    <td><tt>3.3.3</tt></td>
  </tr>
  <tr>
    <td><tt>['pgpool2']['prefix_dir']</tt></td>
    <td>String</td>
    <td>The directory where you want to install the binaries.</td>
    <td><tt>/usr/local</tt></td>
  </tr>
  <tr>
    <td><tt>['pgpool2']['log_dir']</tt></td>
    <td>String</td>
    <td>Directory for log files.</td>
    <td><tt>/var/log/postgresql</tt></td>
  </tr>
  <tr>
    <td><tt>['pgpool2']['use_ssl']</tt></td>
    <td>Boolean</td>
    <td>Set to true if you want to compile OpenSSL support.  Requires OpenSSL to be already installed.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['pgpool2']['memcache_path']</tt></td>
    <td>String</td>
    <td>Path to memcache if using this feature.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['pgpool2']['user']</tt></td>
    <td>String</td>
    <td>Service account user.</td>
    <td><tt>postgres</tt></td>
  </tr>
</table>

#### pgpool2::configure
The attributes in the configure.rb file are used to generate the pgpool.conf file.  The keys are listed under:
['pgpool']['config'].  Override the attributes in your Chef artifact to generate the desired configuration.  It 
may be helpful to review the comments in the attributes/configure.rb file and the pgpool-II documentation.

Values that are defined as true or false will translate to 'on' or 'off' in the configuration file.  If you do not
wish to include a particular key in the configuration, set it's value to nil.

Usage
-----
#### pgpool2::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `pgpool2` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pgpool2]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sean M. Sullivan <sean@pulselocker.com>

Copyright (c) 2014, Pulselocker, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
