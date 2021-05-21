class Task < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :task_relations, foreign_key: :parent_id, dependent: :destroy
end
