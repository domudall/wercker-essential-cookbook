%w{wget build-essential curl git-core nano language-pack-en erlang openjdk-6-jre ruby1.9.3 curl}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{libxslt-dev libxml2-dev imagemagick libmagickwand-dev zlib1g-dev libfreetype6-dev liblcms1-dev libjpeg8-dev libevent-dev libev-dev libyaml-dev libffi-dev libtidy-dev libsqlite3-dev libcurl4-openssl-dev libssl-dev libmemcached-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

script "install_elasticsearch" do
    interpreter "bash"
    user "root"
    code <<-EOH
    cd
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.5.deb
    dpkg -i elasticsearch-0.20.5.deb
    EOH
end


if File.exists? "/vagrant"
  user = "vagrant"
else
  user = "ubuntu"
end

