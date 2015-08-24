# == Class: wt::params
#
# This is a container class with default parameters for wt classes.
class wt::params {
  $config_dir        = '/etc/wt'
  $config_file       = "${config_dir}/wt_config.xml"
  $custom_properties = {}
  $libraries_path    = undef
  $log_file          = '/var/log/wthttp.log'
  $log_config        = '* -debug'
  $package_ensure    = 'present'
  $package_name      = 'witty'
  $use_package       = true
}
