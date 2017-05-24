#%w(libxrandr-dev libxrandr2).each do |lib|
#apt_preference lib do
  #glob lib
  #pin 'release n=stretch'
  #pin_priority '900'
#end
#end

#package 'libxrandr-dev'
