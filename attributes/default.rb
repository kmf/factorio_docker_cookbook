#
# Cookbook:: factorio_docker_cookbook
# Attributes:: default
#
# Copyright:: 2020, Team Otto, Apache-2.0

default['docker']['installation']['type'] = 'default'
default['docker']['image'] = 'factoriotools/factorio'
default['docker']['directory'] = '/factorio'
default['docker']['tcp_port'] = 27015
default['docker']['udp_port'] = 34197
default['docker']['image']['tag'] = 'stable'

default['host']['tcp_port'] = 27015
default['host']['udp_port'] = 34197
default['host']['directory'] = '/opt/factorio'

default['docker']['tcp_port_mapping'] = "#{node['host']['tcp_port']}:#{node['docker']['tcp_port']}/tcp"
default['docker']['udp_port_mapping'] = "#{node['host']['udp_port']}:#{node['docker']['udp_port']}/udp"
default['docker']['port_mapping'] = "#{node['docker']['tcp_port_mapping']}, #{node['docker']['udp_port_mapping']}"
default['docker']['volume_mapping'] = "#{node['host']['directory']}:#{node['docker']['directory']}"