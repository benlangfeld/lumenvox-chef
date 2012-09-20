yum_repository "LumenVox" do
  name "LumenVox"
  description "LumenVox Products $basearch"
  url "http://www.lumenvox.com/packages/EL6/$basearch/"
  action :add
end

package 'LumenVoxCore'
