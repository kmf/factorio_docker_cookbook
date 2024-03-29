#
# Cookbook:: factorio_docker_cookbook
# Recipe:: default
#
# Copyright:: 2021, Team Otto, Apache-2.0

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

directory "#{node['host']['directory']}/config" do
  action :create
end

template "#{node['host']['directory']}/config/server-adminlist.json" do
  source 'server-adminlist.json.erb'
  action :create
end

# template "#{node['docker']['directory']}/config/server-settings.json" do
#  source 'server-settings.json.erb'
#  action :create
# end

# template "#{node['docker']['directory']}/config/map-gen-settings.json" do
#  source 'map-gen-settings.json.erb'
#  action :create
# end

# template "#{node['docker']['directory']}/config/map-gen-settings.json" do
#  source 'map-gen-settings.json.erb'
#  action :create
# end
