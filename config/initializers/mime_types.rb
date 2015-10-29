# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

module Concoctify
  JSON_API_MIME = 'application/vnd.api+json'
end

Mime::Type.register Concoctify::JSON_API_MIME, :json_api

ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup(Concoctify::JSON_API_MIME)] = lambda do |body|
  JSON.parse(body)
end
