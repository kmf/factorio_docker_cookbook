# InSpec test for recipe factorio_docker_cookbook::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe file('/opt/factorio') do
  it { should exist }
  its('mode') { should cmp '00755' }
end

describe docker_container(name: 'factorio') do
  its('repo') { should eq 'factoriotools/factorio' }
  its('tag') { should eq 'stable' }
  its('ports') { should eq '0.0.0.0:27015->27015/tcp, 0.0.0.0:34197->34197/udp' }
end
