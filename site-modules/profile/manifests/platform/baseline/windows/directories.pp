class profile::platform::baseline::windows::directories {

   file { 'C:\Users\Public':
    ensure => 'directory',
    owner  => 'Sample Windows User',
    group  => 'Administrators',
  }
