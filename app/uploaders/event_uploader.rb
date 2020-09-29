class EventUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  process resize_to_limit: [400, 400]
  process convert: 'png'

  #storage :file
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end
  #def extension_whitelist
  #  %w(jpg jpeg gif png)
  #end
end
