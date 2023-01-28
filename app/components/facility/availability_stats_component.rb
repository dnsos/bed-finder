# frozen_string_literal: true

class Facility::AvailabilityStatsComponent < ViewComponent::Base
  renders_many :availability_stats, Visualization::ScaledUpNumberComponent

  def initialize(label:, **args)
    @label = label
    @args = args
  end
end
