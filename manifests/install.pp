# Private class
class wt::install inherits wt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $wt::use_package {
    package { $wt::package_name:
      ensure => $wt::package_ensure,
      alias  => 'wt',
    }
  }
  else
  {
    file { '/usr/local/lib':
      ensure  => directory,
      owner   => 0,
      group   => 0,
      mode    => '0644',
      source  => $wt::libraries_path,
      recurse => true
    }->
    exec { 'ldconfig':
      path        => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ],
      refreshonly => true,
      subscribe   => File['/usr/local/lib'],
    }
  }

  file { $wt::log_dir:
    ensure  => directory,
    owner   => 0,
    group   => 0,
    mode    => '0755',
  }
}
