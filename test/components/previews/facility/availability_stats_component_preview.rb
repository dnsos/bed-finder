# frozen_string_literal: true

class Facility::AvailabilityStatsComponentPreview < ViewComponent::Preview
  def default
    render Facility::AvailabilityStatsComponent.new(label: "Freie Betten") do |component|
      component.with_availability_stat(number: 17, label: "männlich")
      component.with_availability_stat(number: 14, label: "weiblich")
      component.with_availability_stat(number: 4, label: "divers")
    end
  end
end
