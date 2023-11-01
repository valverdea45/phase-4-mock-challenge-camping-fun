class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    # validates_inclusion_of :age, :in => 8..18
    validates :age, inclusion: { within: 8..18 }

    
end
