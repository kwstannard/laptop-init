include_recipe 'desktop::backports'
package 'i3' do
  options '-t jessie-backports'
end

package [
  'scrot',
  'imagemagick'
]
