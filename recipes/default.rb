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

docker_image node['docker']['image']['repo'] do
  tag "#{node['docker']['image']['tag']}" 
  action :pull
end

docker_container 'factorio' do
  repo node['docker']['image']['repo']
  tag "#{node['docker']['image']['tag']}"
  port ['27015:27015/tcp', '34197:34197/udp']
  volumes [ "#{node['docker']['volume_mapping']}" ]
end
