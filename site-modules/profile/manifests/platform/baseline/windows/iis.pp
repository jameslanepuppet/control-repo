class profile::platform::baseline::windows::iis {

  dism { 'IIS-WebServer':
    ensure => present,
    answer => 'C:\answer\iis.xml',
  }
}
