bash 'installing dependencies' do 
	code <<-EOH
		apt-get -y install autoconf automake libtool
	EOH
end

bash 'installing statsite' do
	code <<-EOH
		cd /home
		git clone https://github.com/armon/statsite.git
		cd statsite
		./bootstrap.sh
		./configure
		make
	EOH
end

template '/home/statsite/statsite.conf' do
	source 'statsite.conf.erb'
end

template '/home/statsite/sinks/opentsdb.js' do
	source 'opentsdb.js.erb'
end

bash 'start server' do
	code <<-EOH
		cd /home/statsite
		./src/statsite -f /home/statsite/statsite.conf &
	EOH
end
