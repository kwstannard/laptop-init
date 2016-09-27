default = {
  desktop: {
    display_manager: "i3wm",
  },
  rbenv: {
    rubies: [],
    gems: Hash.new do |h, k|
      h[k] = [
        { name: 'bundler' },
        { name: 'pry' },
      ]
    end,
    plugins: [
      { git_url: 'git@github.com:tpope/rbenv-aliases' },
      { git_url: 'git@github.com:tpope/rbenv-communal-gems' },
    ],
  },
}.merge(default || {})
