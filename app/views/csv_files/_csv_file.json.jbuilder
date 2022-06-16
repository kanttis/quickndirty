json.extract! csv_file, :id, :fields_to_sanitize, :tags_to_keep, :copy_source_fields, :copy_destination_fields, :original_file, :created_at, :updated_at
json.url csv_file_url(csv_file, format: :json)
json.original_file url_for(csv_file.original_file)
