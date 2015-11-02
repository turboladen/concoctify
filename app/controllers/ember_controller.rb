class EmberController < ApplicationController
  def index
    render :index, layout: false, format: :html
  end
end
