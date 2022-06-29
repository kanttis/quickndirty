class CsvFile < ApplicationRecord
  has_one_attached :original_file

  validates :fields_to_sanitize, presence: true
  validates :tags_to_keep, presence: true
  validates :copy_source_fields, presence: true
  validates :copy_destination_fields, presence: true
  validates :delimeter, presence: true, inclusion: {in: %w(, ; |)}
end
