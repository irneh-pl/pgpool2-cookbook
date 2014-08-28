PGPOOL2-COOKBOOK CHANGELOG
==========================

Be sure to view the README for implementation details!

1.0.3
-----
- Added test harness for unit test coverage.

1.0.2
-----
- Added dependency versions.

1.0.1
-----
- Fixed bug for Debian systems.  Performs apt update before installing other packages.
- Added recipe to install and configure failover/recovery scripts for master-slave mode.

1.0.0
-----
- Production release.

0.2.1
-----
- Added delayed service restart event to template actions.
- Install recipe creates directories for logs and pid file.

0.2.0
-----
- Updated configure recipe to generate the pgpool.conf from the configure attributes.

0.1.0
-----
- Included install recipe that installs pgpool-II from source.
- Included the hba recipe, which generates the pg_hba.conf and pool_hba.conf files.
- Supports test-kitchen integration testing with Vagrant.
- Tested with Ubuntu 12.04 and 14.04.

