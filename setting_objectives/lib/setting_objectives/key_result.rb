module SettingObjectives
  class KeyResult
    attr_reader :title

    def initialize(id, title)
      @id = id
      @title = title
    end
  end
end
