class jenkins {
#  package { 'jenkins':
#        ensure => 'installed',
#}
include jenkins
#include jenkins::package
service {
    'jenkins':
    enable => true,
    ensure => 'running',
  }
  jenkins::plugin { 'ant':}
  jenkins::plugin { 'apache-httpcomponents-client-4-api':}
  jenkins::plugin { 'bootstrap4-api':}
  jenkins::plugin { 'bootstrap5-api':}
  jenkins::plugin { 'bouncycastle-api':}
  jenkins::plugin { 'branch-api':}
  jenkins::plugin { 'build-timeout':}
  jenkins::plugin { 'caffeine-api':}
  jenkins::plugin { 'checks-api':}
  jenkins::plugin { 'command-launcher':}
  jenkins::plugin { 'credentials-binding':}
  jenkins::plugin { 'credentials':}
  jenkins::plugin { 'display-url-api':}
  jenkins::plugin { 'durable-task':}
  jenkins::plugin { 'echarts-api':}
  jenkins::plugin { 'email-ext':}
  jenkins::plugin { 'font-awesome-api':}
  jenkins::plugin { 'git-client':}
  jenkins::plugin { 'git':}
  jenkins::plugin { 'git-server':}
  jenkins::plugin { 'github-api':}
  jenkins::plugin { 'github-branch-source':}
  jenkins::plugin { 'github':}
  jenkins::plugin { 'gradle':}
  jenkins::plugin { 'jackson2-api':}
  jenkins::plugin { 'jjwt-api':}
  jenkins::plugin { 'ace-editor':}
  jenkins::plugin { 'handlebars':}
  jenkins::plugin { 'momentjs':}
  jenkins::plugin { 'jquery3-api':}
  jenkins::plugin { 'jsch':}
  jenkins::plugin { 'junit':}
  jenkins::plugin { 'ldap':}
  jenkins::plugin { 'lockable-resources':}
  jenkins::plugin { 'mailer':}
  jenkins::plugin { 'matrix-auth':}
  jenkins::plugin { 'matrix-project':}
  jenkins::plugin { 'okhttp-api':}
  jenkins::plugin { 'antisamy-markup-formatter':}
  jenkins::plugin { 'pam-auth':}
  jenkins::plugin { 'pipeline-graph-analysis':}
  jenkins::plugin { 'blueocean-pipeline-api-impl':}
  jenkins::plugin { 'workflow-basic-steps':}
  jenkins::plugin { 'build-steps-from-json':}
  jenkins::plugin { 'pipeline-build-step':}
  jenkins::plugin { 'declarative-pipeline-migration-assistant-api':}
  jenkins::plugin { 'pipeline-model-extensions':}
  jenkins::plugin { 'groovy':}
  jenkins::plugin { 'pipeline-github-lib':}
  jenkins::plugin { 'pipeline-github':}
  jenkins::plugin { 'pipeline-input-step':}
  jenkins::plugin { 'job-import-plugin':}
  jenkins::plugin { 'job-exporter':}
  jenkins::plugin { 'pipeline-milestone-step':}
  jenkins::plugin { 'pipeline-model-api':}
  jenkins::plugin { 'pipeline-multibranch-defaults':}#
  jenkins::plugin { 'inodes-monitor':}
  jenkins::plugin { 'terminate-ssh-processes-plugin':}
  jenkins::plugin { 'pipeline-rest-api':}
  jenkins::plugin { 'workflow-scm-step':}
  jenkins::plugin { 'blueocean-pipeline-scm-api':}
  jenkins::plugin { 'shared-objects':}
  jenkins::plugin { 'pipeline-stage-step':}
  jenkins::plugin { 'pipeline-stage-tags-metadata':}
  jenkins::plugin { 'pipeline-stage-view':}
  jenkins::plugin { 'workflow-step-api':}
  jenkins::plugin { 'plain-credentials':}
  jenkins::plugin { 'compuware-topaz-utilities':}
  jenkins::plugin { 'popper2-api':}
  jenkins::plugin { 'popper-api':}
  jenkins::plugin { 'resource-disposer':}
  jenkins::plugin { 'scm-api':}
  jenkins::plugin { 'script-security':}
  jenkins::plugin { 'snakeyaml-api':}
  jenkins::plugin { 'ssh-agent':}
  jenkins::plugin { 'ssh-credentials':}
  jenkins::plugin { 'ssh':}
  jenkins::plugin { 'structs':}
  jenkins::plugin { 'timestamper':}
  jenkins::plugin { 'secondary-timestamper-plugin':}
  jenkins::plugin { 'token-macro':}
  jenkins::plugin { 'trilead-api':}
  jenkins::plugin { 'ws-cleanup':}

}

#----------------------------------------------------------------------

node 'eduard1' {
package { 'nginx':
    ensure => installed,
    }

file {'/etc/nginx/sites-enabled/eduard_domain':
    owner => 'root',
    group => 'root',
    ensure => present,
    source => '/tmp/puppet_file/eduard_domain',
  }

service { 'nginx':
    ensure => 'running',
    enable => true,
    require => Package['nginx']
  }

include apt

   apt::ppa { 'ppa:openjdk-r/ppa':
       ensure => present,
   }
   exec { 'apt-update':
      command => '/usr/bin/apt-get update',
      require => [
        Apt::Ppa['ppa:openjdk-r/ppa']
       ],
    }

      package { 'openjdk-8-jdk':
        require  => [
          Exec['apt-update'],
          Apt::Ppa['ppa:openjdk-r/ppa'],
        ],
      }

#-------------------jenkins--------


package { 'jenkins':
    ensure => 'installed',
  }


}



