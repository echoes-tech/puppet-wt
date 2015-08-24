define wt::service (
  $binary_name    = undef,
  $binary_path    = undef,
  $cert_file      = undef,
  $http_port      = 80,
  $https          = false,
  $https_port     = 443,
  $log_file       = "/var/log/${service_name}",
  $priv_key_file  = undef,
  $service_enable = true,
  $service_ensure = 'running',
  $service_name   = 'wt',
) {

  validate_string($binary_name)
  validate_path($binary_path)
  validate_integer($http_port,undef,1)
  validate_bool($https)
  validate_path($log_file)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_string($service_name)
  if $https {
    validate_path($cert_file)
    validate_integer($https_port,undef,1)
    validate_path($priv_key_file)
  }

  file { $log_file:
    ensure  => 'file',
    owner   => 0,
    group   => 0,
    mode    => '0644',
  }->
  file { "/etc/logrotate.d/${service_name}":
    ensure  => 'file',
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('wt/service.logrotate.erb'),
  }->
  file { "/etc/default/${service_name}":
    ensure  => 'file',
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('wt/service.default.erb'),
  }->
  file { "/etc/init.d/${service_name}":
    ensure  => 'file',
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('wt/service.init.erb'),
  }->
  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File["/etc/default/${service_name}","/etc/init.d/${service_name}"]
  }
}
