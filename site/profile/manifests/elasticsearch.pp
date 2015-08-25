class profile::elasticsearch {
  class { '::elasticsearch':
    manage_repo  => true,
    repo_version => '1.7'
  }
  elasticsearch::plugin { 'elasticsearch/elasticsearch-cloud-aws': }
}
