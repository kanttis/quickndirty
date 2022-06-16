class CreateCsvFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :csv_files do |t|
      t.string :fields_to_sanitize
      t.string :tags_to_keep
      t.string :copy_source_fields
      t.string :copy_destination_fields

      t.timestamps
    end
  end
end
