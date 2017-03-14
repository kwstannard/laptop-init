apt_preference 'tmux' do
  glob 'tmux'
  pin 'release o=Debian Backports'
  pin_priority '900'
end

package 'tmux'
