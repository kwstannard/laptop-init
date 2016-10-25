override.merge!({
  desktop: {
    display_manager: "i3wm",
  },
  rbenv: {
    user_installs: [
      { user: normal[:desktop][:user][:name] }
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
  home: normal[:desktop][:user][:home],
  group: normal[:desktop][:user][:group],
  user: normal[:desktop][:user][:name],

  x_vars: {
    key_delay: 250,
    key_repeat_rate: 50,
  },

  remote_sources_dir: File.join(normal[:desktop][:user][:home], ".remote_sources")
})
