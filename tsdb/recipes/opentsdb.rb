#sync from git
git "#{node['tsdb']['base_path']}" do
        repository 'git://github.com/OpenTSDB/opentsdb.git'
        action :sync
end

execute 'build opentsdb' do
        cwd '/opentsdb'
        command "./build.sh ; ./configure ; make ; make install"
end


template '/etc/init.d/opentsdb' do
	source 'startscript.sh.erb'
	mode '555'
end

execute 'start the server' do
        command 'service opentsdb start'
end