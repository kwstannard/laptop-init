package %w[
alien
]

path = "/tmp/oracleic/"
base_url = "http://download.oracle.com/otn/linux/instantclient/11204/"
file_prefix = "oracle-instantclient11.2-"
file_suffix = "-11.2.0.4.0-1.x86_64.rpm"

http_request "https://login.oracle.com/mysso/signon.jsp" do
  action :nothing
  message "username=#{node[:oracleic][:user]};password=#{node[:oracleic][:password]}"
end

%w[
basic
devel
sqlplus
].each do |f|
  file_path = path + file_prefix + f + file_suffix
  final_path = path + file_prefix + f + "_11.2.0.4.0-2_amd64.deb"
  url = base_url + file_prefix + f + file_suffix

  remote_file final_path do
    source url
    action :create_if_missing
    owner node[:desktop][:user][:name]
    group node[:desktop][:user][:group]
    notifies :run, "alien --to-deb #{file_path}", :immediately
  end

  execute "alien --to-deb #{file_path}" do
    cwd path
    notifies :install, "dpkg_package[#{f}]", :immediately
    action :nothing
  end

  dpkg_package f do
    action :nothing
    source final_path
  end
end

chef_gem 'nokogiri' do
  compile_time false
end

require 'digest'
require 'fileutils'
require 'tmpdir'

instantclient_html_path = '/tmp/' + Dir::Tmpname.make_tmpname('instantclient', 'html')
instantclient_deb_path = "#{Chef::Config[:file_cache_path]}/icaclient_amd64.deb"
instantclient_checksum = 'd41e70624960b9dd9c4856bfb051dad4ef1eb4eb6a586a530b09dc74a714b1df'

instantclient_deb_is_valid = lambda do
  (
    File.exists?(instantclient_deb_path) &&
    Digest::SHA256.hexdigest(File.read(instantclient_deb_path)) == instantclient_checksum
  )
end

remote_file instantclient_html_path do
  source [
           'legacy-receiver-for-linux/receiver-for-linux-134.html',
           'linux/receiver-for-linux-latest.html'
         ].map { |fragment| top_url + fragment }
  not_if{ instantclient_deb_is_valid.call }
end

#
# We fetch the download page to get the rel reflecting our acceptance
# of the EULA.  (Not to worry: the user will be prompted with a
# duplicate EULA when the app is actually launched.)
#
ruby_block 'oracle-login' do
  block do
    require 'nokogiri'
    page = Nokogiri::HTML(open(instantclient_html_path))
    final_rel =
      page.css(".ctx-dl-link")
      .map{|el| el['rel']}
      .select{ |rel| rel.include?("icaclient") && rel.include?("amd64") }
      .first
    link = "https:#{final_rel}"
    node.run_state['desktop_instantclient_onetime_url'] = link
  end
  not_if{ instantclient_deb_is_valid.call }
end

#
# The checksum prevents us from attempting a download over and over.
#
# Deleting the checksum will make this recipe blow up: The file will
# always need to be downloaded, but the one-time URL will never be
# present in the expected attribute.
#
ruby_block 'instantclient-download' do
  block do
    Chef::Resource::RemoteFile.new(instantclient_deb_path,
                                   run_context).tap do |rr|
      rr.source node.run_state['desktop_instantclient_onetime_url']
      rr.checksum instantclient_checksum
      rr.run_action :create
    end
  end

  not_if{ instantclient_deb_is_valid.call }
end
# libc6 (>= 2.13-38), libice6 (>= 1:1.0.0), libgtk2.0-0 (>= 2.12.0), libsm6, libx11-6, libxext6, libxmu6, libxpm4, libasound2, libstdc++6, libwebkit-1.0-2 | libwebkitgtk-1.0-0, libidn11, zlib1g
