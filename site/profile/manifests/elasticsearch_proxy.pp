class profile::elasticsearch_proxy (
  $user,
  $password
) {

  openssl::certificate::x509 { 'elasticsearch':
    country      => 'US',
    organization => 'salekseev.com',
    commonname   => $fqdn,
  }

  ->

  class { '::nginx': }

  ->

  httpauth { "$user":
    file      => '/etc/nginx/htpasswd',
    password  => $password,
    realm     => 'realm',
    mechanism => basic,
    ensure    => present,
  }

  ->

  file { '/etc/nginx/htpasswd':
    group => 'www-data',
    mode  => 0640,
  }

}