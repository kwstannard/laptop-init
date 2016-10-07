rf = File.join(Chef::Config[:file_cache_path], "google-talkplugin_current_amd64.deb")

remote_file rf do
  not_if 'dpkg -S google-talkplugin'
  source "https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb"
end

dpkg_package "google-talkplugin" do
  source rf
end
