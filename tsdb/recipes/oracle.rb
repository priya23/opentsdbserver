case node['platform_family']
when 'redhat', 'centos', 'fedora'
execute 'add repo' do
    command 'wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"'
end

rpm_package 'jdk-8u60-linux-x64' do
  action :install
end

when 'debian', 'ubuntu'
         package 'python-software-properties' do
           action :install
            options '--force-yes'
  end
     execute 'add repo for ubuntu' do
         command "add-apt-repository ppa:webupd8team/java;apt-get update"
     end
  execute "install oracle" do
        command   "echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | sudo debconf-set-selections;apt-get -y install oracle-java8-installer"
      end
end

#creating tem for tsdb server
directory '/tmp/cache1' do
  mode '0755'
  action :create
end

directory '/opentsdb' do
  mode '0755'
  action :create
end

#cloning the tsbd code
git '/opentsdb/' do
  repository "https://github.com/OpenTSDB/opentsdb.git"
  reference "master"
  action :sync
end