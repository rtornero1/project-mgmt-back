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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
