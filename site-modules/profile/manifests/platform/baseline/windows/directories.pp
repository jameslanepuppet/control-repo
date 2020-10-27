class profile::platform::baseline::windows::directories {

   file { 'c:\users\public\test':
    ensure => 'directory',
    owner  => 'Sample Windows User',
    group  => 'Administrators',
  }
  
  acl { 'c:\users\public\test':
    permissions => [
    { identity => 'Administrator', rights => ['read'] },
    { identity => 'Users', rights => ['read','execute'] }
  } 
}
