# frozen_string_literal: true

class Facility::AvailabilityStatsComponentPreview < ViewComponent::Preview
  def default
    render Facility::AvailabilityStatsComponent.new(label: "Freie Betten") do |component|
      component.with_availability_stat(number: 17, label: "Für Männer")
      component.with_availability_stat(number: 14, label: "Für Frauen")
      component.with_availability_stat(number: 4, label: "Für Diverse")
    end
  end
end
