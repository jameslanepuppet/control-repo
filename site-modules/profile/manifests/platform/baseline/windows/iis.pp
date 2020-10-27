class profile::platform::baseline::windows::iis {

  dism { 'IIS-WebServer':
    ensure => present,
  }
  
 # Create Directories

  file { 'c:\\inetpub\\complete':
    ensure => 'directory'
  }

  file { 'c:\\inetpub\\complete_vdir':
    ensure => 'directory'
  }

# Set Permissions

  acl { 'c:\\inetpub\\complete':
    permissions => [
      {'identity' => 'IISCompleteGroup', 'rights' => ['read', 'execute']},
    ],
  }

  acl { 'c:\\inetpub\\complete_vdir':
    permissions => [
      {'identity' => 'IISCompleteGroup', 'rights' => ['read', 'execute']},
    ],
  }

# Configure IIS

  iis_application_pool { 'complete_site_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

#Application Pool No Managed Code .Net CLR Version set up
  iis_application_pool {'test_app_pool':
    ensure                    => 'present',
    enable32_bit_app_on_win64 => true,
    managed_runtime_version   => '',
    managed_pipeline_mode     => 'Classic',
    start_mode                => 'AlwaysRunning'
  }

  iis_site { 'complete':
    ensure           => 'started',
    physicalpath     => 'c:\\inetpub\\complete',
    applicationpool  => 'complete_site_app_pool',
    enabledprotocols => 'https',
    bindings         => [
      {
        'bindinginformation'   => '*:443:',
        'protocol'             => 'https',
        'certificatehash'      => '3598FAE5ADDB8BA32A061C5579829B359409856F',
        'certificatestorename' => 'MY',
        'sslflags'             => 1,
      },
    ],
    require => File['c:\\inetpub\\complete'],
  }

  iis_virtual_directory { 'vdir':
    ensure       => 'present',
    sitename     => 'complete',
    physicalpath => 'c:\\inetpub\\complete_vdir',
    require      => File['c:\\inetpub\\complete_vdir'],
  }
}
