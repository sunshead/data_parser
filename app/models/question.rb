class Question < ActiveRecord::Base
	attr_accessible :question, :answer, :distractors, :difficulty

	enum difficulty: [:easy, :medium, :hard]

	scope :sorted, lambda { order("questions.id ASC")}

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |question|
				csv << question.attributes.values_at(*column_names)
			end
		end
	end
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = ["question", "answer","distractors"]
	  #header = spreadsheet.row(1).to_s.split(/\|/)
	  (2..spreadsheet.last_row).each do |i|
	    row = [header, spreadsheet.row(i).to_s.gsub("[","").gsub("\"","").gsub("]","").split(/\|/)].transpose.to_h
	    question = find_by_id(row["id"]) || new
	    question.attributes = row.slice(*accessible_attributes)
	    question.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
	  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
