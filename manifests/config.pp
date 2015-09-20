# Private class
class wt::config inherits wt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { '/var/lib/wt':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { $wt::config_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { $wt::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => template("${module_name}/wt_config.xml.erb"),
  }

  file { '/etc/logrotate.d/wthttp':
      ensure => 'file',
      owner  => 0,
      group  => 0,
      mode   => '0644',
      source => tempalte("${module_name}/wthttp.logrotate.erb"),
  }
}
