class Attachment < ActiveRecord::Base
  has_attached_file :xml

  validates_xml :xml, :xsd_path => "#{Rails.root}/public/shiporder.xsd"
end
