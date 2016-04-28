name 'opentsdb'

description 'Application cookbook which installs and configures OpenTSDB.'

version '1.1.9'

supports 'redhat', '>= 5.8'
supports 'centos', '>= 5.8'
supports 'ubuntu', '>= 12.04'

depends 'java'
depends 'poise', '~> 2.2'
depends 'poise-service', '~> 1.0'
