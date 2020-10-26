#
# Cookbook:: factorio_docker_cookbook
# Recipe:: default
#
# Copyright:: 2020, Team Otto, Apache-2.0

docker_installation 'default'

directory '/opt/factorio' do
  mode '0755'
  action :create
end

service 'docker' do
  action [ :enable, :start ]
end

docker_image 'factoriotools/factorio' do
  tag 'stable'
  action :pull
end

docker_container 'factorio' do
  repo 'factoriotools/factorio'
  tag 'stable'
  port ['27015:27015/tcp', '34197:34197/udp']
  volumes [ '/opt/factorio:/factorio' ]
end
