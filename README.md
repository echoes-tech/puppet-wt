# wt

[![Build Status](https://travis-ci.org/echoes-tech/puppet-wt.svg?branch=master)]
(https://travis-ci.org/echoes-tech/puppet-wt)
[![Flattr Button](https://api.flattr.com/button/flattr-badge-large.png "Flattr This!")]
(https://flattr.com/submit/auto?user_id=echoes&url=https://forge.puppetlabs.com/echoes/wt&title=Puppet%20module%20to%20manage%20Wt&description=This%20module%20installs%20and%20configures%20Wt.%20It%20allows%20you%20to%20enable%20HTTP%20Dashboard%20an%20to%20add%20check%20from%20a%20file.&lang=en_GB&category=software "Puppet module to manage Wt installation and configuration")

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with wt](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with wt](#beginning-with-wt)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Contributors](#contributors)

## Overview

Puppet module to manage Wt installation and configuration.


## Module Description

This module installs and configures [Wt](http://www.webtoolkit.eu/).

## Setup

### Setup requirements

If you do not want use the packaged version of Wt (```$use_package = false```), you have to be sure to have the following dependencies installed:

- boost::thread
- boost::random
- boost::regex
- boost::signals
- boost::system
- boost::filesystem
- boost::datetime

To Be Completed with Boost Module

### Beginning with wt

```puppet
include 'wt'
```

## Usage

ToDo

## Reference

### Classes

#### Public classes

* wt: Main class, includes all other classes.

#### Private classes

* wt::params: Sets parameter defaults per operating system.
* wt::install: Handles the packages.
* wt::config: Handles the configuration file.

#### Parameters

The following parameters are available in the `::wt` class:

##### `custom_properties`

Specifies the custom properties you can add to Wt config file. Valid options: hash. Default value: undef

Read more: http://www.webtoolkit.eu/wt/doc/reference/html/overview.html#config_general

##### `libraries_path`

Tells Puppet where to find the Wt libraries if you do not want to use the package from your OS. Valid options: string. Default value: undef

##### `log_dir`

Tells Puppet what Wt log directory to create. Valid options: path. Default value: '/var/log/wt'

##### `log_filename`

Tells Puppet what Wt log file to create. Valid options: string. Default value: 'wthttp.log'

##### `log_config`

Specifies the log configuration for the Wt server. Valid options: string. Default value: "* -debug"

Read more: http://www.webtoolkit.eu/wt/doc/reference/html/classWt_1_1WLogger.html

##### `package_ensure`

Tells Puppet whether the Wt package should be installed, and what version. Valid options: 'present', 'latest', or a specific version number. Default value: 'present'

##### `package_name`

Tells Puppet what Wt package to manage. Valid options: string. Default value: 'wt'

##### `use_package`

Tells Puppet whether OS package must be used. Valid option: boolean. Default value : true

### Defines

#### Public defines

* wt::service: Sets a service to be launched with a Wt server.

#### Parameters

The following parameters are available in the `::wt::service` define:

##### `binary_path`

Specifies the path of the binary that will be launched. Valid options: path. Default value: undef

##### `cert_file`

Specifies the certificate file to be used to launch the Wt server in https mode. Valid options: path. Default value: undef

##### `http_port`

Specifies the http port of the Wt server. Valid options: integer >= 1. Default value: 80

##### `https`

Tells Puppet whether the Wt server must be start with https mode. Valid options: boolean. Default value: false

##### `https_port`

Specifies the https port of the Wt server. Valid options: integer >= 1. Default value: 443

##### `log_dir`

Tells Puppet what Wt log directory to create. Valid options: path. Default value: '/var/log/wt'

##### `log_filename`

Tells Puppet what Wt log file to create. Valid options: string. Default value: 'access.log'

##### `priv_key_file`

Specifies the private key file to be used to launch the Wt server in https mode. Valid options: path. Default value: undef

##### `service_ensure`

Tells Puppet whether the Wt service should be running. Valid options: 'running' or 'stopped'. Default value: 'running'

##### `service_manage`

Tells Puppet whether to manage the Wt service. Valid options: 'true' or 'false'. Default value: 'true'

##### `service_name`

Tells Puppet what Wt service to manage. Valid options: string. Default value: 'wt'

## Limitations

Debian family OSes is officially supported. Tested and built on Debian.

##Development

[Echoes Technologies](https://www.echoes-tech.com) modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great.

[Fork this module on GitHub](https://github.com/echoes-tech/puppet-wt/fork)

## Contributors

The list of contributors can be found at: https://github.com/echoes-tech/puppet-wt/graphs/contributors
