# Paperclip XML Validator

## Usage

    # In config/environment.rb
    class Attachment < ActiveRecord::Base
      has_attached_file :xml

      validates_attachment_valid_xml :xml, :xsd_path => "#{Rails.root}/public/shiporder.xsd"
    end

This project rocks and uses MIT-LICENSE.
