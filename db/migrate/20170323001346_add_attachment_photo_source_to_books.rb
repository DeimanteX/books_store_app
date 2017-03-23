class AddAttachmentPhotoSourceToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :photo
      t.attachment :source
    end
  end

  def self.down
    remove_attachment :books, :photo
    remove_attachment :books, :source
  end
end
