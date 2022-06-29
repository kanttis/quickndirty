class AddDelimeterToCsvFile < ActiveRecord::Migration[7.0]
  def change
    add_column :csv_files, :delimeter, :string
  end
end
