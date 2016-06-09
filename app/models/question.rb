class Question < ActiveRecord::Base
	enum difficulty: [:easy, :medium, :hard]

	scope :sorted, lambda { order("questions.difficulty ASC")}

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |question|
				csv << question.attributes.values_at(*column_names)
			end
		end
	end
end
