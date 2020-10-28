class profile::platform::baseline::windows::packages {

  Package {
    ensure   => 'present',
    provider => chocolatey,
  }

  package { '7zip': }

}
