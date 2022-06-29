require('csv')
require('sanitize')

module CsvSanitizer

    def self.import_csv(path)
        CSV.parse(File.read(path), headers: true)
    end

    def self.export_csv(tbl, path)
        CSV.open(path, "w", headers: true) do |csv|
            csv << tbl.headers
            tbl.each do |row|
                csv << row
            end
        end
    end

    def self.sanitize_table_rows(tbl, fields, tags_to_keep)
        CSV::Table.new(
            tbl.map do |row|
                fields.split(",").each do |field|
                    t = Sanitize.fragment(row[field], Sanitize::Config.merge(
                            Sanitize::Config::BASIC,
                                :elements => tags_to_keep.split(","),
                                :attributes => Sanitize::Config::BASIC[:attributes].merge({"iframe" => ['allowfullscreen', 'frameborder', 'height', 'src', 'width'] })))
                    t = t.gsub("&nbsp;", " ")
                    row[field] = t.gsub("&amp;", "&")
                end
                row
            end
        )
    end

    def self.copy_field_content(tbl, source_fields, destination_fields)
        sfs = source_fields.split(",")
        dfs = destination_fields.split(",")
        CSV::Table.new(
            tbl.map do |row|
                for i in 0..sfs.length do
                    row[dfs[i]] = row[sfs[i]]
                end
                row
            end
        )        
    end
end
