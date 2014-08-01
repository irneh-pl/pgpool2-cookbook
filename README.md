pgpool2 Cookbook
================
This cookbook installs and configures pgpool-II, a connection management application for PostgreSQL.

Requirements
------------
The cookbook currently only supports Ubuntu OS.

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
</table>

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
Authors: Sean M. Sullivan <sean@pulselocmer.com> - Pulselocker, Inc.

This cookbook is distributed under the Apache License v2.0.
