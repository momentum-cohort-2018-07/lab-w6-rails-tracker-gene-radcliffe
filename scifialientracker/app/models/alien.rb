class Alien < ApplicationRecord
    has_many :notes, dependent: :destroy
end
