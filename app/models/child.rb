class Child < ApplicationRecord
  has_many :chores
  has_many :tasks, through: :chores

  validates_presence_of :first_name, :last_name

  scope :alphabetical, -> { order(last_name: :asc, first_name: :asc) }
  scope :active, -> { where(active: true) }

  def name
    "#{first_name} #{last_name}"
  end

  def points_earned
    self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
  end 
end
