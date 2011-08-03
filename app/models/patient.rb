class Patient < ActiveRecord::Base
  has_many :history_items
end
