class ApiController < ActionController::API
  include ActionController::RespondWith
  include ActionController::ImplicitRender
  extend EmberRailsHelper
end
