class Review < ApplicationRecord
  belongs_to :entreprise
  belongs_to :user
end
