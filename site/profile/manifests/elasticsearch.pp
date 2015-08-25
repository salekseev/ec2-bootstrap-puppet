class profile::elasticsearch ($config) {
  class { '::elasticsearch':
    manage_repo  => true,
    repo_version => '1.7'
  }
  elasticsearch::instance { 'instance-01':
    config => $config,
  }
  elasticsearch::plugin { 'elasticsearch/elasticsearch-cloud-aws/2.7.0':
    module_dir => 'elasticsearch-cloud-aws',
    instances  => ['instance-01']
  }
}
