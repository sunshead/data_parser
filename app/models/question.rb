class Question < ActiveRecord::Base
	enum difficulty: [:easy, :medium, :hard]

	scope :sorted, lambda { order("questions.difficulty ASC")}
end
