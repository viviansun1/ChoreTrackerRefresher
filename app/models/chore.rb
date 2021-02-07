class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :tasks
end
