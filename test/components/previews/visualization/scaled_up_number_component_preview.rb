# frozen_string_literal: true

class Visualization::ScaledUpNumberComponentPreview < ViewComponent::Preview
  def default
    render(Visualization::ScaledUpNumberComponent.new(number: 1234, label: 'is a nice number'))
  end
end
