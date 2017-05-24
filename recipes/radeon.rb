libs=%w(
firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati
)

libs.each do |l|
  apt_preference l do
    glob l
    pin "release n=jessie-backports"
    pin_priority "900"
  end
end

package libs
