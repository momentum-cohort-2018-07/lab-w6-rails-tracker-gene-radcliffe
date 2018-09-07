class Note < ApplicationRecord
    belongs_to :alien
    validates :alien_id, presence: true
end
