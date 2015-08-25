class profile::elasticsearch {
  class { '::elasticsearch':
    manage_repo => true
  }
  elasticsearch::plugin { 'elasticsearch/elasticsearch-cloud-aws': }
}
