#
# Configure swift cache_errors.
#
# == Dependencies
#
# == Examples
#
#  include 'swift::proxy::log_urls'
#
# == Authors
#
#
# == Copyright
#
#
class swift::proxy::logs_urls() {

  concat::fragment { 'swift_logs_urls':
    target  => '/etc/swift/proxy-server.conf',
    content => template('swift/proxy/logs_urls.conf.erb'),
    order   => '50',
  }

  package { 'python-mysqldb':
    ensure => installed,
  }

  vcsrepo { '/opt/omh':
    ensure   => latest,
    provider => git,
    source   => 'https://git.siminn.is/cloud-storage/omh.git',
  }

  file { '/usr/lib/python2.7/dist-packages/swift/common/middleware/logs_urls.py':
    ensure => link,
    mode   => '0644',
    target => '/opt/omh/logs_urls.py',
  }

  file { '/usr/lib/python2.7/dist-packages/swift/common/middleware/tempauth.py':
    ensure => link,
    mode   => '0644',
    target => '/opt/omh/tempauth.py',
  }

  file { '/usr/lib/python2.7/dist-packages/swift3/middleware.py':
    ensure => link,
    mode   => '0644',
    target => '/opt/omh/middleware.py',
  }
}