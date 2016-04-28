package 'gnuplot' do
	action :install
end
bash 'install dependencies' do
        code <<-EOH
                apt-get -y install autotools-dev  autoconf make python git
        EOH
end