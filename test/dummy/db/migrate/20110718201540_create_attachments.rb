class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :xml_file_name
      t.string :xml_content_type
      t.integer :xml_file_size

      t.timestamps
    end
  end
end
