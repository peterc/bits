require 'bundler/inline'

gemfile do
  source 'https://rubygems.org/'
  #gem 'ruby-sdl2'
  gem 'sdl2_ffi'
end

require 'sdl2'
require 'sdl2/audio'

SDL2.init(SDL2::INIT::AUDIO)

p SDL2::Audio

class AudioStruct < FFI::Struct
  layout :freq, :format, :channels, :samples, :userdata, :callback
end

spec = AudioStruct.new
spec.freq = 48000
spec.format = SDL2::Audio::F32SYS
spec.channels = 1
spec.samples = 4096

p SDL2::open_audio_device(nil, 0, spec, spec, SDL2::Audio::ALLOW_FREQUENCY_CHANGE)

