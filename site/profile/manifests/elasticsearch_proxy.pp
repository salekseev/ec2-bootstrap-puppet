class profile::elasticsearch_proxy {
  class { '::nginx': }
  ->
  httpauth { 'user':
    file      => '/etc/nginx/htpasswd',
    password  => 'password',
    realm     => 'realm',
    mechanism => basic,
    ensure    => present,
  }
}