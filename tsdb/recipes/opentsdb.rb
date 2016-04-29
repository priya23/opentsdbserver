bash 'installing opentsdb' do
	cwd '/home'
                code <<-EOH
                        git clone git://github.com/OpenTSDB/opentsdb.git
						cd opentsdb
						./build.sh
						./configure
						make
						make install
                EOH
        end

bash 'start the server' do
	code <<-EOH
		cd /home/priyankas/opentsdb
		rm -rf /tmp/cache1/*
		nohup ./build/tsdb tsd --port=4242 --staticroot=./build/staticroot --cachedir=/tmp/cache1 --zkquorum=<%=node[:hadoop][:zookeeper]%>:2181 --auto-metric &
	EOH
end