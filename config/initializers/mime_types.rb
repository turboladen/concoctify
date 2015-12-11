# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

module Concoctify
  API_MIME_TYPES = %w[
    application/vnd.api+json
    text/x-json
    application/json
  ]
end

Mime::Type.unregister :json
Mime::Type.register 'application/json', :json, Concoctify::API_MIME_TYPES
