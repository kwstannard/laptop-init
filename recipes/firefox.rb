dir = File.join(node[:desktop][:user][:home], '.mozilla', 'firefox', '3expduhd.default')

template File.join(dir, "extensions.json") do
  source "extensions.json"
end
template File.join(dir, "extensions.ini") do
  source "extensions.ini"
end
