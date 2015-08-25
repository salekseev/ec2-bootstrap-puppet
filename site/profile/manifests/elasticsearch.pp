class profile::elasticsearch ($config) {
  class { '::elasticsearch': }
  elasticsearch::instance { 'instance-01':
    config => $config,
  }
  elasticsearch::plugin { 'elasticsearch/elasticsearch-cloud-aws/2.7.0':
    module_dir => 'cloud-aws',
    instances  => 'instance-01'
  }
}
