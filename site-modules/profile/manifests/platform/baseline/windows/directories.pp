class profile::platform::baseline::windows::directories {

   file { 'C:\Users\Public\Test':
    ensure => 'directory',
    owner  => 'Sample Windows User',
    group  => 'Administrators',
  }
