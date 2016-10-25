template File.join(node[:home], ".xinitrc") do
  source "xinitrc"
  variables wm: node[:desktop][:display_manager]
end

template File.join(node[:home], ".xsessionrc") do
  source "xsessionrc"
  variables node[:x_vars]
end
