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
template '/home/opentsdb/build/start.sh' do
        source 'start.sh.erb'
        mode '555'
end
bash 'start the server' do
        code <<-EOH
                cd /home/opentsdb/build
                rm -rf /tmp/cache1/*
                ./start.sh
        EOH
end