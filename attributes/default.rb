#
# Cookbook:: factorio_docker_cookbook
# Attributes:: default
#
# Copyright:: 2020, Team Otto, Apache-2.0

default['docker']['installation']['type'] = 'default'
default['docker']['image'] = 'factoriotools/factorio'
default['docker']['directory'] = '/factorio'
default['factorio']['directory'] = '/opt/factorio'
default['docker']['volume_mapping'] = "#{node['factorio']['directory']}:#{node['docker']['directory']}"