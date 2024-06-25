class MasterImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :compressed do
    resize_to_fit(928, nil)
  end

  version :large, :from_version => :compressed do
    # process :crop_large
    resize_to_fit(700, nil)
  end

  # version :poster, :from_version => :compressed do
  #   process :crop_poster
  # end

  version :teaser, :from_version => :large do
    resize_to_fit(640, 356)
  end

  version :thumb, :from_version => :large do
    resize_to_fit(288, 160)
  end

  version :link, :from_version => :large do
    resize_to_fit(63, 35)
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg png webp jiff)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token(10)}.#{file.extension}" if original_filename
  end

  protected

    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

    # def crop_large
    #   manipulate! do |img|
    #     x, y, w, h = 0, 0, 0, 0

    #     if !model.pin_image.crop_y.nil?
    #       y = model.crop_y.to_i
    #       h = 515
    #       img.resize "928"
    #     elsif !model.crop_x.nil?
    #       x = model.crop_x.to_i
    #       w = 928
    #       img.resize "x515"
    #     end

    #     img.crop("#{w}x#{h}+#{x}+#{y}!")
    #     img
    #   end
    # end

    # def crop_poster
    #   manipulate! do |img|
    #     x, y, w, h = 0, 0, 0, 0

    #     if !model.crop_y.nil?
    #       y = model.crop_y.to_i/(928.to_f/284)
    #       h = 428
    #       img.resize "284"
    #     elsif !model.crop_x.nil?
    #       x = model.crop_x.to_i/(515.to_f/428)
    #       w = 284
    #       img.resize "x428"
    #     end

    #     img.crop("#{w}x#{h}+#{x}+#{y}!")
    #     img
    #   end
    # end

end
