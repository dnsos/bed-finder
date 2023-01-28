# frozen_string_literal: true

class Visualization::ScaledUpNumberComponent < ViewComponent::Base
  def initialize(number:, label: "")
    @number = number
    @label = label
  end
end
