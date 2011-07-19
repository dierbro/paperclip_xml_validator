begin
  require "paperclip"
rescue LoadError
  puts "PaperclipXmlValidator requires that you install the Paperclip gem."
  exit
end

begin
 require "nokogiri"
rescue LoadError
 puts "PaperclipXmlValidator requires that you install the Nokogiri gem."
 exit
end

begin
 require "mime/types"
rescue LoadError
 puts "PaperclipXmlValidator requires that you install the mime-types gem."
 exit
end

module Paperclip
 module ClassMethods
  # Places ActiveRecord-style validations on the xml conformancy.
  # The possible options are:
  # * +xsd_path+: path of the xsd file
  # * +message+: The message to display when the uploaded file has an invalid
  #   content type.
  # * +if+: A lambda or name of a method on the instance. Validation will only
  #   be run is this lambda or method returns true.
  # * +unless+: Same as +if+ but validates if lambda or method returns false.
  def validates_attachment_valid_xml name, options = {}
   validation_options = options.dup

   return if options[:xsd_path].nil?

   xsd = Nokogiri::XML::Schema(File.read(options[:xsd_path]))

   validates_each(name.to_sym, validation_options) do |record, attr, value|
    next if record.attachment_for(name).nil?
    doc = Nokogiri::XML(record.attachment_for(name).queued_for_write[:original])
    xsd.validate(doc).each do |error|
     record.errors.add(attr, error.message)
    end
   end
  end
 end
end
