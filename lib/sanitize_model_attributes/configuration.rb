class SanitizeModelAttributes::Configuration
  attr_accessor :white_character_maps

  def initialize
    @white_character_maps = {}
  end
end
