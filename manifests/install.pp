# Candlepin installation packages
class candlepin::install {
  package { ['candlepin']:
    ensure => $candlepin::version,
  }

  if $candlepin::manage_wget {
    ensure_packages(['wget'], { ensure => $candlepin::wget_version, })
  }
}
