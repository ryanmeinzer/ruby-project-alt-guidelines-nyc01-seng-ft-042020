class Trail < ActiveRecord::Base
    has_many :rides
    has_many :shredders, through: :rides
end 