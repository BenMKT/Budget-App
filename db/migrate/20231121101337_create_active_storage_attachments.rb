class CreateActiveStorageAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :active_storage_attachments do |t|
      t.string :name, null: false
      t.string :record_type, null: false
      t.bigint :record_id, null: false
      t.bigint :blob_id, null: false

      t.index :blob_id, name: "index_active_storage_attachments_on_blob_id"
      t.index [:record_type, :record_id, :name, :blob_id], name: "index_active_storage_attachments_uniqueness", unique: true

      t.timestamps
    end
  end
end
