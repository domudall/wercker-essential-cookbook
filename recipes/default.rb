%w{wget build-essential curl git-core nano language-pack-en nodejs}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{libxslt-dev libxml2-dev imagemagick libmagickwand-dev zlib1g-dev libfreetype6-dev liblcms1-dev libjpeg8-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{xvfb firefox}.each do |pkg|
  package pkg do
    action :install
  end
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
    wget http://phantomjs.googlecode.com/files/phantomjs-1.7.0-linux-x86_64.tar.bz2
    mkdir phantomjs
    tar -C phantomjs --strip-components=1 -xf phantomjs-1.7.0-linux-x86_64.tar.bz2
    echo 'export PATH=\"$HOME/phantomjs/bin:$PATH\"' >> ~/.bash_profile

    EOH
end