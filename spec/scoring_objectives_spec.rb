require 'rails_helper'

path = Rails.root.join('scoring_objectives/spec')

Dir.glob("#{path}/**/*_spec.rb") do |file|
  require file
end
