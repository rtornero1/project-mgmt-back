class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :task
end
