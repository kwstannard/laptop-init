name = node[:desktop][:user][:name]

template "/etc/systemd/system/suspend@#{name}.service" do
  source "suspend.service"
  variables user: name
end

template "/etc/systemd/system/resume@#{name}.service" do
  source "resume.service"
end

service "suspend@#{name}" do
  action :enable
end

service "resume@#{name}" do
  action :enable
end
