# Configuration for Candlepin
class candlepin::config {

  if $candlepin::manage_tomcat_user {
    user { 'tomcat':
      ensure => present,
      groups => $candlepin::user_groups,
    }
  }

  concat::fragment { 'General Config':
    target  => $::candlepin::candlepin_conf_file,
    content => template('candlepin/candlepin.conf.erb'),
  }

  concat{ $::candlepin::candlepin_conf_file:
    mode  => '0600',
    owner => 'tomcat',
    group => 'tomcat',
  }

  file { "/etc/${candlepin::tomcat}/server.xml":
    ensure  => file,
    content => template("candlepin/${candlepin::tomcat}/server.xml.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

}
