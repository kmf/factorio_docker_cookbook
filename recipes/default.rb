#
# Cookbook:: factorio_docker_cookbook
# Recipe:: default
#
# Copyright:: 2020, Team Otto, All Rights Reserved.
docker_installation 'default'

directory '/opt/factorio' do
  owner '845'
  group '845'
  mode '0755'
  action :create
end

docker_image 'factoriotools/factorio' do
  tag 'stable'
  action :pull
end

docker_container 'factorio' do
  repo 'factoriotools'
  tag 'stable'
  port ['27015:27015/tcp', '34197:34197/udp']
  volumes [ '/opt/factorio:/factorio' ]
end