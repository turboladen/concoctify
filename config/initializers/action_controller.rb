require 'action_controller/metal/renderers'
require 'active_model/serializable_resource'

ActionController::Renderers.add(:json_api) do |content, options|
  self.content_type ||= Mime[:json_api]
  valid_options = options.each_with_object({}) do |(k, v), result|
    result[k] = v if %i[include].include?(k)
  end

  Rails.logger.debug "json_api options: #{options}"
  Rails.logger.debug "json_api valid options: #{valid_options}"
  Rails.logger.debug "content class: #{content.class}"
  # ActiveModel::SerializableResource.new(content, valid_options).serializable_hash.to_json
  # content.to_json
  content
end
