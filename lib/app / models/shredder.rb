class Shredder < ActiveRecord::Base
    has_many :rides
    has_many :trails, through: :rides
end 