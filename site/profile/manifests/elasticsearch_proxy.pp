class profile::elasticsearch_proxy (
  $user,
  $password
) {
  class { '::nginx': }
  ->
  httpauth { "$user":
    file      => '/etc/nginx/htpasswd',
    password  => $password,
    realm     => 'realm',
    mechanism => basic,
    ensure    => present,
  }
}