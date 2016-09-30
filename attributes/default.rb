overrides = {
  desktop: {
    display_manager: "i3wm",
  },
  rbenv: {
    user_installs: [
      { user: "kwstannard" }
    ],
    user_rubies: ['2.1.7', '2.3.1'],
    user_plugins: [
      { name: 'aliases', git_url: 'https://github.com/tpope/rbenv-aliases' },
      { name: 'communal', git_url: 'https://github.com/tpope/rbenv-communal-gems' },
    ],
    communal_gems: {
      'bundler' => {},
      'pry' => {},
    },
  },
}
overrides.each do |k,v|
  default[k].merge! v
end
