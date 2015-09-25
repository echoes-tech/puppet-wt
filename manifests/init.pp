class wt (
  $custom_properties = $wt::params::custom_properties,
  $libraries_path    = $wt::params::libraries_path,
  $log_dir           = $wt::params::log_dir,
  $log_filename      = $wt::params::log_filename,
  $log_config        = $wt::params::log_config,
  $package_ensure    = $wt::params::package_ensure,
  $package_name      = $wt::params::package_name,
  $use_package       = $wt::params::use_package,
) inherits wt::params {
  validate_hash($custom_properties)
  validate_absolute_path($log_dir)
  validate_string($log_filename)
  validate_string($log_config)
  validate_string($package_ensure)
  validate_string($package_name)
  validate_bool($use_package)
  if !$use_package {
    validate_string($libraries_path)
  }

  $log_file = "${log_dir}/${log_filename}"

  anchor { "${module_name}::begin": } ->
  class { "${module_name}::install": } ->
  class { "${module_name}::config": } ->
  anchor { "${module_name}::end": }
}
