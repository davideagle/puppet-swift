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
class swift::proxy::log_urls() {

  concat::fragment { 'swift_log_urls':
    target  => '/etc/swift/proxy-server.conf',
    content => template('swift/proxy/log_urls.conf.erb'),
    order   => '50',
  }

  file { '/usr/lib/python2.7/dist-packages/swift/common/middleware/logs_urls.py':
    ensure => file,
    mode   => '0644',
    source => 'https://git.siminn.is/cloud-storage/omh/raw/master/logs_urls.py',
  }

  file { '/usr/lib/python2.7/dist-packages/swift/common/middleware/tempauth.py':
    ensure => file,
    mode   => '0644',
    source => 'https://git.siminn.is/cloud-storage/omh/raw/master/tempauth.py',
  }

  file { '/usr/lib/python2.7/dist-packages/swift3/middleware.py':
    ensure => file,
    mode   => '0644',
    source => 'https://git.siminn.is/cloud-storage/omh/raw/master/middleware.py',
  }
}
