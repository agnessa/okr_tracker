module ApplicationHelper
  def score_as_percentage(score)
    number_to_percentage(score * 100, precision: 0, format: '%n')
  end
end
