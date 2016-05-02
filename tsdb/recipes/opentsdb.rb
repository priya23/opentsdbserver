#building tsdb
execute 'build opentsdb' do
        cwd '/opentsdb'
        command "./build.sh ; ./configure ; make ; make install"
end

#placing the init script
template '/etc/init.d/opentsdb' do
	source 'startscript.sh.erb'
	mode '555'
end

#staring the service
execute 'start the server' do
        command 'rm -rf /tmp/cache1/*;service opentsdb start'
end