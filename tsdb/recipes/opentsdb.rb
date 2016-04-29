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
template '/etc/init.d/opentsdb' do
	source 'startscript.sh.erb'
	mode '555'
end

bash 'start the server' do
        code <<-EOH
                rm -rf /tmp/cache1/*
                service opentsdb start
        EOH
end