
class swift::proxy::log_urls {

  concat::fragment { 'swift_log_urls':
    target  => '/etc/swift/proxy-server.conf',
    content => template('swift/proxy/log_urls.conf.erb'),
    order   => '50',
  }

}
