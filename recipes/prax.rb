rf = File.join(Chef::Config[:file_cache_path], "prax.deb")

remote_file rf do
  not_if 'dpkg -S prax'
  source "https://github.com/ysbaddaden/prax.cr/releases/download/v0.5.1/prax_0.5.1-1_amd64.deb"
  checksum '744b3cfee50c3b7e004ef1de862ea963'
end

dpkg_package "prax" do
  source rf
end
