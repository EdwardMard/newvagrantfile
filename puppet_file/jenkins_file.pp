node 'eduard1' {
  exec {
    'jenkins download':
    command => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian-stable/binary/jenkins_1.565.1_all.deb',
    cwd => '/tmp',
    creates => '/tmp/jenkins_1.565.1_all.deb',
    timeout => 0
  }

  package { 'jenkins':
    ensure => 'installed',
    provider => 'dpkg',
    source => "/tmp/jenkins_1.565.1_all.deb",
    require => [Package['memcached'], Package['openjdk-7-jdk']]
  }



  service {
    'jenkins':
    enable => true,
    ensure => running,
    hasrestart => true,
    hasstatus => true,
    require => Package['jenkins install']
  }
}
