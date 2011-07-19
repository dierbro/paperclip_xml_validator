require 'test_helper'

class PaperclipXmlValidatorTest < ActiveSupport::TestCase
  test "XML document that conforms to the schema" do
   attachment = Attachment.new({:xml => File.new("#{Rails.root}/public/shiporder.xml")})
   assert attachment.save
  end

  test "XML document that doesn't conform to the schema" do
   attachment = Attachment.new({:xml => File.new("#{Rails.root}/public/country.xml")})
   assert !attachment.save
  end

  test "Attachment without XML document" do
   attachment = Attachment.new({:xml => nil})
   assert !attachment.save
  end
end
