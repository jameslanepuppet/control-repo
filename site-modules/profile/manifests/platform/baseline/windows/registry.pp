#requires puppetlabs/registry

class profile::platform::baseline::windows::registry {

 # registry_value { 'Enable IE ESC for Administrators':
 #   path   => 'HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Active Setup/Installed Components/{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}',
 #   ensure => present,
 # }
  registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability':
    ensure => present,
  }
}
