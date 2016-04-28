case node['platform_family']
when 'redhat', 'centos', 'fedora'
bash 'add repo' do
        code <<-EOH
                wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
                yum -y localinstall jdk-8u60-linux-x64.rpm
        EOH
end
end
when 'debian', 'ubuntu'
	bash 'add repo for debian' do
		code <<-EOH
			apt-get -y install python-software-properties
			add-apt-repository ppa:webupd8team/java
			apt-get update
			apt-get -y install oracle-java8-installer
		EOH
	end
end