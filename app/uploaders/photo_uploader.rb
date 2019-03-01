class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    resize_to_fit 70, 70
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

end