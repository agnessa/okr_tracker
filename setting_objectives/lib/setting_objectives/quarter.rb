module SettingObjectives
  class Quarter
    attr_reader :start_date

    def initialize(start_date)
      @start_date = start_date
      @end_date = @start_date + 3.months
    end

    def date_range_formatted
      format = '%-d %B %Y'
      @start_date.strftime(format) + ' - ' + @end_date.strftime(format)
    end
  end
end
