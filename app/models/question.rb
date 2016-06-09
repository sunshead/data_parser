class Question < ActiveRecord::Base
	enum difficulty: [:easy, :medium, :hard]
end
