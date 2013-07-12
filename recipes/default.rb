%w{wget build-essential curl git-core nano language-pack-en nodejs npm erlang openjdk-6-jre ruby1.9.3 wget curl}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{libxslt-dev libxml2-dev imagemagick libmagickwand-dev zlib1g-dev libfreetype6-dev liblcms1-dev libjpeg8-dev libevent-dev libev-dev libyaml-dev libffi-dev libtidy-dev libsqlite3-dev libcurl4-openssl-dev libssl-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{memcached mongodb-clients libv8-dev}.each do |pkg|
  package pkg do
    action :install
  end
end


%w{xvfb firefox libqtwebkit4 wkhtmltopdf}.each do |pkg|
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


script "install_phantomjs" do
    interpreter "bash"
    user user
    environment ({ 'HOME' => '/home/' + user })
    code <<-EOH
    cd
    wget http://phantomjs.googlecode.com/files/phantomjs-1.8.2-linux-x86_64.tar.bz2
    mkdir phantomjs
    tar -C phantomjs --strip-components=1 -xf phantomjs-1.8.2-linux-x86_64.tar.bz2
    echo 'export PATH=\"$HOME/phantomjs/bin:$PATH\"' >> ~/.bash_profile

    EOH
end
