define wt::service (
  $binary_path    = undef,
  $cert_file      = undef,
  $http_port      = 80,
  $https          = false,
  $https_port     = 443,
  $log_dir        = '/var/log/wt',
  $log_filename   = 'access.log',
  $priv_key_file  = undef,
  $service_enable = true,
  $service_ensure = 'running',
  $service_name   = 'wt',
) {

  validate_absolute_path($binary_path)
  validate_integer($http_port, 65535, 1)
  validate_bool($https)
  validate_absolute_path($log_dir)
  validate_string($log_filename)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_string($service_name)
  if $https {
    validate_absolute_path($cert_file)
    validate_integer($https_port, 65535, 1)
    validate_absolute_path($priv_key_file)
  }

  $log_file = "${log_dir}/${log_filename}"

  file { $log_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
  }->
  file { "/etc/logrotate.d/${service_name}":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/service.logrotate.erb"),
  }->
  file { "/etc/default/${service_name}":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/service.default.erb"),
  }->
  file { "/etc/init.d/${service_name}":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/service.init.erb"),
  }->
  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => File[ "${binary_path}/${service_name}" ]
    subscribe  => File[
      "${binary_path}/${service_name}",
      "/etc/default/${service_name}",
      "/etc/init.d/${service_name}"
    ]
  }
}
