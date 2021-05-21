class Task < ApplicationRecord
  has_many :children, class_name: "Task", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Task"
  belongs_to :user
  has_many :projects, dependent: :destroy
end
