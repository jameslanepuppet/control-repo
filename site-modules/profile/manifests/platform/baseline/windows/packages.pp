#Requires puppetlabs-chocolately
#Requires puppetlabs-reboots

class profile::platform::baseline::windows::packages {

  Package {
    ensure   => 'present',
    provider => chocolatey,
  }

  package { '7zip': }

  reboot { 'after':
    subscribe       => Package['7zip'],
  }
}
