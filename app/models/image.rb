class Image < ActiveRecord::Base
  FILESYSTEM_STORAGE = {
    :url  => "/system/#{Rails.env.production? ? '' : Rails.env + '/'}:class/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/#{Rails.env.production? ? '' : Rails.env + '/'}:class/:attachment/:id/:style/:basename.:extension"
  }
  S3_STORAGE = {
    :storage => :s3,
    :s3_credentials => "#{File.dirname(__FILE__)}/../../config/amazon_s3.yml",
    :bucket => 'kore',
    :path => "#{RAILS_ENV}/:class/:attachment/:id/:style/:basename.:extension",
    :s3_headers => {'Cache-Control' => 'max-age=2147483648'}
  }
  
  belongs_to :source, :polymorphic => true
  
  has_attached_file :attachment,{
    :styles => {
      :thumb   => ["75x75#", :jpg],
      :mid     => ["200x200#", :jpg],
      :small   => ["250", :jpg],
      :medium   => ["500", :jpg],
      :large => ["800", :jpg]
    }
  }.update(['test','development'].include?(RAILS_ENV) ? FILESYSTEM_STORAGE : S3_STORAGE)
end