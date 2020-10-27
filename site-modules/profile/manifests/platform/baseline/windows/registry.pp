#requires puppetlabs/registry

class profile::platform::baseline::windows::registry {
  
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability':
    ensure => present,
    data  => '1',
    type  => 'dword',
  }
}
