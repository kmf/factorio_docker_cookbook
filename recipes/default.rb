#
# Cookbook:: factorio_docker_cookbook
# Recipe:: default
#
# Copyright:: 2020, Team Otto, Apache-2.0

docker_installation node['docker']['installation']['type']

directory node do
  mode '0755'
  action :create
end

service 'docker' do
  action [ :enable, :start ]
end

docker_image node['docker']['image'] do
  tag "#{node['docker']['image']['tag']}"
  action :pull
end

docker_container 'factorio' do
  repo 'factoriotools/factorio'
  tag "#{node['docker']['image']['tag']}"
  port [ "#{node['docker']['port_mapping']}" ]
  volumes [ "#{node['docker']['volume_mapping']}" ]
end
