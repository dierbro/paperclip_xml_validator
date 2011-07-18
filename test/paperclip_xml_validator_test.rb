require 'test_helper'

class PaperclipXmlValidatorTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Paperclip
  end

  test "attachment" do
   Attachment.create
   assert true
  end
end
