class Objective < ApplicationRecord
  has_many :key_results, primary_key: :uid
end
