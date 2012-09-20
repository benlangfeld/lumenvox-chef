package 'zip'

remote_file "/tmp/js185.tar.gz" do
  source "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz"
end

script "install_spidermonkey" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  tar -zxf js185.tar.gz
  cd js-1.8.5/js/src
  autoconf-2.13
  ./configure
  make
  make install
  EOH
end

yum_repository "LumenVox" do
  name "LumenVox"
  description "LumenVox Products $basearch"
  url "http://www.lumenvox.com/packages/EL6/$basearch/"
  action :add
end

package 'LumenVoxCore'
