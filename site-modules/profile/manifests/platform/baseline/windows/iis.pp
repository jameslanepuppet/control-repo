class profile::platform::baseline::windows::iis {

  dism { 'IIS-WebServer':
    ensure => present,
  }
  # Create Directories

  file { 'c:/inetpub':
    ensure => 'directory'
  }

  iis_application_pool { 'minimal_site_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  } ->

  iis_site { 'minimal':
    ensure          => 'started',
    physicalpath    => 'c:/inetpub/minimal',
    applicationpool => 'minimal_site_app_pool',
    require         => File['minimal'],
  }

  file { 'minimal':
    ensure => 'directory',
    path   => 'c:/inetpub/minimal',
  }
}
