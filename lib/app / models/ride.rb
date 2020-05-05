class Ride < ActiveRecord::Base
    belongs_to :shredder
    belongs_to :trail
end