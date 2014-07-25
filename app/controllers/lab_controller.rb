class LabController < ApplicationController
  layout 'clean'
  def index
    @sliders = LabSlider.all
  end
end
