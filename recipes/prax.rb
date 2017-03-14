rf = File.join(Chef::Config[:file_cache_path], "prax.deb")

remote_file rf do
  not_if 'dpkg -S prax'
  source "https://github.com/ysbaddaden/prax.cr/releases/download/v0.6.1/prax_0.6.1-1_amd64.deb"
end

dpkg_package "prax" do
  not_if !File.exists?(rf)
  source rf
end


