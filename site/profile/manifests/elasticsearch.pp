class profile::elasticsearch {
  class { 'elasticsearch': }
  elasticsearch::plugin { 'elasticsearch/elasticsearch-cloud-aws': }
}
