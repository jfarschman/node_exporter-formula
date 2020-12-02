require 'serverspec'

# Required by serverspec
set :backend, :exec

describe user('node_exporter') do
  it { should exist }
  it { should belong_to_group 'node_exporter' }
end

describe port(9100) do
  it { should be_listening.with('tcp6') }
end

describe file('/usr/local/bin/node_exporter') do
  it { should exist }
  it { should be_owned_by 'node_exporter' }
  it { should be_grouped_into 'node_exporter' }
end

describe service('node_exporter.service') do
  it { should be_running }
  it { should be_enabled }
end
