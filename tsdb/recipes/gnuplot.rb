#installing dependencies
%w{gnuplot autotools-dev autoconf make python git}.each do |pkg|
  package pkg do
    action :install
    options '--force-yes'
  end
end