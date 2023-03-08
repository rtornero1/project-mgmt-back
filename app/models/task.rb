# == Schema Information
#
# Table name: tasks
#
#  id             :bigint           not null, primary key
#  caption        :text             not null
#  comments_count :integer          default(0)
#  status         :string           default("backlog")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :bigint           not null
#
# Indexes
#
#  index_tasks_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Task < ApplicationRecord

  belongs_to :owner, class_name: "User", counter_cache: true

  has_many :comments

  has_many :authors, through: :comments

  validates :caption, presence: true

  validates :owner_id, presence: true

  enum status: {
    backlog: "backlog", 
    in_progress: "in_progress", 
    completed: "completed"
  }
end
