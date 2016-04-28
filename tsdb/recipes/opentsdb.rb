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