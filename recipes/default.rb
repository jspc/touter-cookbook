yum_repository 'epel' do
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch'
  description 'Extra Packages for Enterprise Linux 5 - $basearch'
  enabled true
  gpgcheck true
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL'
end

package['golang']
package['make']

git "#{node['touter']['clone_dir']}/touter" do
  repository "https://github.com/jspc/touter.git"
end

execute 'make touter' do
  cwd "#{node['touter']['clone_dir']}/touter"
  command "make"
end

execute 'insta;; touter' do
  cwd "#{node['touter']['clone_dir']}/touter"
  command "make install"
end
