class Dish < ActiveRecord::Base
    has_many :orders
end
