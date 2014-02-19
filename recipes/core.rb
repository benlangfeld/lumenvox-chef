package 'zip'

include_recipe "yum-repoforge"

%w(libxml2 libxml2-devel uuid uuid-devel libxslt libxslt-devel libstdc++ js js-devel).each{|lib| package lib}

yum_repository "LumenVox" do
  name "LumenVox"
  description "LumenVox Products $basearch"
  url "http://www.lumenvox.com/packages/EL6/$basearch/"
  gpgcheck false
  action :add
end

yum_package 'LumenVoxCore' do
  version node['lumenvox']['core']['version']
end
