class City < ApplicationRecord
  belongs_to :department, optional: true
end