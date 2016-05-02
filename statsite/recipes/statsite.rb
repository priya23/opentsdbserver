#install the dependencies
%w{autoconf automake libtool }.each do |pkg|
  package pkg do
    action :install
    options '--force-yes'
  end
end

directory '/statsite' do
  mode '0755'
  action :create
end

#cloning from git
git '/statsite/' do
  repository "https://github.com/armon/statsite.git"
  reference "master"
  action :sync
end

execute 'build statsite' do
        cwd '/statsite'
        command "./bootstrap.sh; ./configure ; make"
end

template '/statsite/statsite.conf' do
	source 'statsite.conf.erb'
end

template '/statsite/sinks/opentsdb.js' do
	source 'opentsdb.js.erb'
end

template '/etc/init.d/statsite' do
	source 'startscript.sh.erb'
	mode '555'
end

execute 'start the server' do
  command "service statsite start"
end