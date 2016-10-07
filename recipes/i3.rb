include_recipe 'desktop::backports'

package [
  'scrot',
  'imagemagick'
]

package 'i3' do
  version '4.12'
end
