name             'pgpool2'
maintainer       'Pulselocker, Inc.'
maintainer_email 'sean@pulselocker.com'
license          'Apache 2.0'
description      'Installs/Configures pgpool2-cookbook'
long_description 'Installs/Configures pgpool2-cookbook'
version          '1.0.3'

recipe 'pgpool2', 'Installs and configures pgpool-II with a simple configuration.'
recipe 'pgpool2::install', 'Installs pgpool-II from source.'
recipe 'pgpool2::hba', 'Generates the hba conf files.'
recipe 'pgpool2::configure', 'Generates the pgpool.conf file.'

depends 'build-essential'
depends 'postgresql'
depends 'apt'

